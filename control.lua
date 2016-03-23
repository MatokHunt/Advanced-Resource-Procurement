require "defines"

local debug_mode = true
local vein_area = 7
local starting_area = 350

script.on_init(function()
  pcall(function()
    --Setup
    if global.ticks == nil then global.ticks = 0 end
	if global.drillrigs == nil then global.drillrigs = {} end
  end)
end)

script.on_event(defines.events.on_player_created, function(event)
  pcall(function()
    if debug_mode then
	  game.player.insert{name = "deep-bore-drill", count = 1}
	  game.player.insert{name = "drill-rig", count = 1}
	  game.player.insert{name = "solar-panel", count = 40}
	  game.player.insert{name = "medium-electric-pole", count = 40}
	  game.player.insert{name = "steel-chest", count = 40}
	  
	  game.player.insert{name = "offshore-pump", count = 1}
	  game.player.insert{name = "pipe", count = 50}
	  
	  game.player.insert{name = "chemical-plant", count = 1}
	  
	  game.player.insert{name = "dirty-iron-ore", count = 50}
	  
	  game.player.insert{name = "storage-tank", count = 20}
	  
	  game.player.insert{name = "basic-mining-drill", count = 1}
	  
	  game.always_day = true
	  
	  for name,technology in pairs(game.player.force.technologies) do technology.researched=technology.enabled end
	end
  end)
end)

script.on_event(defines.events.on_tick, function(event)
  global.ticks = global.ticks + 1
  local count = 0
  -- Check once a second...
  -- Since there is no event for when an assembly machine completes crafting.
  if (global.ticks % 60) == 0 then 
    for i, rig in ipairs(global.drillrigs) do
	  if not rig.valid then
	    table.remove(global.drillrigs, i)
	    -- ToDo: Addtional check for valid well under rig.
	  elseif rig.is_crafting then
	    -- The rig is currently drilling a well, put the placeholder well here.
	  elseif not rig.is_crafting then
	    -- If placeholder well is here, then rig has finished drilling. Finish up the well.
	  end
	  count = count + 1
	end 
    global.ticks = 0
  end 
end)

script.on_event(defines.events.on_resource_depleted, function(event)
  area = {start_at = {x = math.floor(event.entity.position.x - 37), y = math.floor(event.entity.position.y - 37)}, 
		  end_at = {x = math.floor(event.entity.position.x + 37), y = math.floor(event.entity.position.y + 37)}}
	
  if event.entity.position.x < -starting_area or
     event.entity.position.y < -starting_area or
	 event.entity.position.x > starting_area or
	 event.entity.position.y > starting_area then
    if event.entity.name == "iron-ore" then
      if game.get_surface(1).count_entities_filtered{
	    area = {{event.entity.position.x - vein_area,event.entity.position.y - vein_area}, 
		  {event.entity.position.x + vein_area,event.entity.position.y + vein_area}}, 
	    name="iron-vein"} <= 0 then
          game.get_surface(1).create_entity({name = "iron-vein", amount=7500, position = event.entity.position})
      end 
	elseif event.entity.name == "copper-ore" then
	  if game.get_surface(1).count_entities_filtered{
	    area = {{event.entity.position.x - vein_area,event.entity.position.y - vein_area}, 
		  {event.entity.position.x + vein_area,event.entity.position.y + vein_area}}, 
	    name="copper-vein"} <= 0 then
          game.get_surface(1).create_entity({name = "copper-vein", amount=7500, position = event.entity.position})
      end 
	elseif event.entity.name == "coal" then
	  if game.get_surface(1).count_entities_filtered{
	    area = {{event.entity.position.x - vein_area,event.entity.position.y - vein_area}, 
		  {event.entity.position.x + vein_area,event.entity.position.y + vein_area}}, 
	    name="coal-vein"} <= 0 then
          game.get_surface(1).create_entity({name = "coal-vein", amount=7500, position = event.entity.position})
      end 
    end 
  else
    if debug_mode then game.player.print("No Veins In Starting Area.") end 
  end
end)

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
end 

script.on_event(defines.events.on_put_item, function(event)
  if debug_mode then 
    game.player.print("Something placed at " .. event.position.x .. "," .. event.position.y)
  
	if check_for_water(event.position, 50) then game.player.print("Water Found Within " .. 50) else game.player.print("No Water Within " .. 50) end
	
	if check_for_wells(event.position, 25) then game.player.print("Well Found Within " .. 25) else game.player.print("No Wells Within " .. 25) end
  end 
end)

script.on_event(defines.events.on_built_entity, function(event)
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
	  for i, rig in ipairs(global.drillrigs) do
	    game.player.print("Rig @ " .. rig.position.x .. "," .. rig.position.y)
	  end
	end
  end
end)