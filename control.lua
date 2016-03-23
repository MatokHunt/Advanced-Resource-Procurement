require "defines"
require "config"

script.on_init(function()
  pcall(function()
		-- Setup the globals
		-- These are saved with the map
		if global.ticks == nil then global.ticks = 0 end			-- Keeps track of how many ticks go by. Used in the on_tick event.
		if global.drillrigs == nil then global.drillrigs = {} end	-- A table of the valid drill rigs on the map.
  end)
end)

script.on_event(defines.events.on_player_created, function(event)
  pcall(function()
		if arpconfig.debug_mode then 
			-- If we're in debug mode, then give ourselves some stuff to test with.
			game.player.insert{name = "deep-bore-drill", count = 1}
			game.player.insert{name = "drill-rig", count = 1}
			game.player.insert{name = "drill-bit", count = 5}
			game.player.insert{name = "solar-panel", count = 40}
			game.player.insert{name = "medium-electric-pole", count = 40}
			game.player.insert{name = "steel-chest", count = 40}
			
			game.player.insert{name = "offshore-pump", count = 1}
			game.player.insert{name = "pipe", count = 50}
			
			game.player.insert{name = "chemical-plant", count = 1}
			
			game.player.insert{name = "dirty-iron-ore", count = 50}
			
			game.player.insert{name = "storage-tank", count = 20}
			
			game.player.insert{name = "basic-mining-drill", count = 1}
			
			-- Set the game to always daylight
			game.always_day = true
			
			-- Research all technologies
			for name,technology in pairs(game.player.force.technologies) do technology.researched=technology.enabled end
		end
  end)
end)

script.on_event(defines.events.on_tick, function(event)
  global.ticks = global.ticks + 1
  local count = 0
  -- Since there is no event for when an assembly machine completes crafting, we're checking the crafting state of every drill rig every 60 ticks (1 second).
  if (global.ticks % 60) == 0 then 
    for i, rig in ipairs(global.drillrigs) do
			if not rig.valid then
				table.remove(global.drillrigs, i)
				-- ToDo: Addtional check for valid well under rig.
			elseif rig.is_crafting then
			  -- The rig is currently drilling a well, put the placeholder well here.
			  if game.get_surface(1).find_entity("oil-well",rig.position) == nil then
				  game.get_surface(1).create_entity({name = "oil-well", amount=1, position = rig.position})
				end
			elseif not rig.is_crafting then
				-- If placeholder well is here, then rig has finished drilling. Finish up the well.
			end
			count = count + 1
		end 
    global.ticks = 0
  end 
end)

script.on_event(defines.events.on_resource_depleted, function(event)
  if event.entity.position.x < -arpconfig.starting_area or
		event.entity.position.y < -arpconfig.starting_area or
		event.entity.position.x > arpconfig.starting_area or
		event.entity.position.y > arpconfig.starting_area then
		-- We're not in the starting area, so let's check what kind of resource was depleted.
		-- If we don't find any ore-veins of the same type within the minimum distance, then spawn a new ore-vein entity.
    if event.entity.name == "iron-ore" then
      if game.get_surface(1).count_entities_filtered{
				area = {{event.entity.position.x - arpconfig.vein_area,event.entity.position.y - arpconfig.vein_area}, 
				{event.entity.position.x + arpconfig.vein_area,event.entity.position.y + arpconfig.vein_area}}, 
				name="iron-vein"} <= 0 then
        game.get_surface(1).create_entity({name = "iron-vein", amount=7500, position = event.entity.position})
      end 
		elseif event.entity.name == "copper-ore" then
			if game.get_surface(1).count_entities_filtered{
				area = {{event.entity.position.x - arpconfig.vein_area,event.entity.position.y - arpconfig.vein_area}, 
				{event.entity.position.x + arpconfig.vein_area,event.entity.position.y + arpconfig.vein_area}}, 
				name="copper-vein"} <= 0 then
        game.get_surface(1).create_entity({name = "copper-vein", amount=7500, position = event.entity.position})
      end 
		elseif event.entity.name == "coal" then
			if game.get_surface(1).count_entities_filtered{
				area = {{event.entity.position.x - arpconfig.vein_area,event.entity.position.y - arpconfig.vein_area}, 
				{event.entity.position.x + arpconfig.vein_area,event.entity.position.y + arpconfig.vein_area}}, 
				name="coal-vein"} <= 0 then
        game.get_surface(1).create_entity({name = "coal-vein", amount=7500, position = event.entity.position})
      end 
    end 
  else
    if arpconfig.debug_mode then game.player.print("No Veins In Starting Area.") end 
  end
end)

--Helper function for searching an area around a position for any water tiles
function check_for_water(position, range)  
  area = {start_at = {x = math.floor(position.x - range), y = math.floor(position.y - range)}, 
					end_at = {x = math.floor(position.x + range), y = math.floor(position.y + range)}}
  
  for x = area.start_at.x,area.end_at.x,1 do
		for y = area.start_at.y,area.end_at.y,1 do
			if string.match(game.get_surface(1).get_tile(x, y).name, "water") then return true end
		end 
  end 
  return false 
end

--Helper function for searching an area around a position for any crude-oil or natural-gas wells
function check_for_wells(position, range)
  if game.get_surface(1).count_entities_filtered{
		area = {{position.x - range,position.y - range}, 
            {position.x + range,position.y + range}}, 
		name="crude-oil"} > 0 then
    return true
  else
		return false 
  end
  if game.get_surface(1).count_entities_filtered{
		area = {{position.x - range,position.y - range}, 
            {position.x + range,position.y + range}}, 
		name="natural-gas"} > 0 then
    return true
  else
		return false 
  end
	if game.get_surface(1).count_entities_filtered{
		area = {{position.x - range,position.y - range}, 
            {position.x + range,position.y + range}}, 
		name="drill-rig"} > 0 then
    return true
  else
		return false 
  end
end 

script.on_event(defines.events.on_put_item, function(event)
  if arpconfig.debug_mode then 
    -- Test code, only active with debug mode on.
    --game.player.print("Something placed at " .. event.position.x .. "," .. event.position.y)
  
		--if check_for_water(event.position, 50) then game.player.print("Water Found Within " .. 50) else game.player.print("No Water Within " .. 50) end
	
		--if check_for_wells(event.position, 25) then game.player.print("Well Found Within " .. 25) else game.player.print("No Wells Within " .. 25) end
  end 
end)

script.on_event(defines.events.on_built_entity, function(event)
  -- When a new drill rig is placed, check to make sure it is far enough away from water and other wells.
  -- If it is too close, swap the drill rig out with a proxy that can not be used for drilling.
  -- If the location is valid, then add the drill rig to the table of valid drill rigs.
  if event.created_entity.name == "drill-rig" then
		if check_for_water(event.created_entity.position, 50) then
			entity_position = event.created_entity.position
			entity_direction = event.created_entity.direction
			entity_force = event.created_entity.force
			event.created_entity.destroy()
			game.get_surface(1).create_entity{name = "drill-rig-near-water", position = entity_position, direction = entity_direction, force = entity_force}
			game.player.print("Your drill rig has been placed too close to water.")
		elseif check_for_wells(event.created_entity.position, 25) then
			entity_position = event.created_entity.position
			entity_direction = event.created_entity.direction
			entity_force = event.created_entity.force
			event.created_entity.destroy()
			game.get_surface(1).create_entity{name = "drill-rig-near-wells", position = entity_position, direction = entity_direction, force = entity_force}	 
			game.player.print("Your drill rig has been placed too close to another well.")
		else
			table.insert(global.drillrigs, event.created_entity)
		end
  end
end)