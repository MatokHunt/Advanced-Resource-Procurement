-- Modify how crude oil wells work. Wells now require drilling to create.
data.raw.resource["crude-oil"].minimum = 7500 		-- Increase the minimum to 10% of the new normal amount	
data.raw.resource["crude-oil"].normal = 75000		-- Increase amount per well
data.raw.resource["crude-oil"].autoplace = nil		-- Disable well generation on the map

-- Modify oil-processing technology.
data.raw.technology["oil-processing"].effects =
		{
      {
        type = "unlock-recipe",
        recipe = "pumpjack"
      },
      {
        type = "unlock-recipe",
        recipe = "oil-refinery"
      },
      {
        type = "unlock-recipe",
        recipe = "chemical-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "basic-oil-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-light-oil"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-petroleum-gas"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-heavy-oil"
      },
      {
        type = "unlock-recipe",
        recipe = "lubricant"
      },
      {
        type = "unlock-recipe",
        recipe = "drill-rig"
      },
      {
        type = "unlock-recipe",
        recipe = "drill-bit"
      }
    }