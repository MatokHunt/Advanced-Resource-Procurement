data:extend(
{
  {
    type = "resource",
    name = "natural-gas",
    icon = "__base__/graphics/icons/crude-oil.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order="a-b-b",
    infinite = true,
    minimum = 7500,
    normal = 75000,
    minable =
    {
      hardness = 1,
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "natural-gas",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    --[[autoplace =
    {
      control = "natural-gas",
      sharpness = 1,
      max_probability = 0.04,
      richness_multiplier = 1, --150000
      richness_base = 75, --5000
      size_control_multiplier = 0.06,
      peaks =
      {
        {
          influence = 0.1
        },
        {
          influence = 0.105,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
		{
		  influence = -0.99, 
		  max_influence = 0, 
		  noise_layer = "crude-oil", 
		  noise_octaves_difference = -2.3, 
		  noise_persistence = 0.45,
		},
        {
          influence = 0.67,
          noise_layer = "natural-gas",
          noise_octaves_difference = -2.7,
          noise_persistence = 0.3
        }
      }
    },--]]
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0.4, g=0.1, b=0.8},
    map_grid = false
  },
  {
    type = "resource",
    name = "iron-vein",
    icon = "__base__/graphics/icons/crude-oil.png",
    flags = {"placeable-neutral"},
    category = "ore-vein",
    order="a-b-c",
    infinite = true,
    minimum = 1500,
    normal = 7500,
    minable =
    {
      hardness = 1,
      mining_time = 3,
      results =
      {
        {
          type = "item",
          name = "dirty-iron-ore",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    --[[autoplace =
    {
      control = "iron-vein",
      sharpness = 1,
      max_probability = 0.04,
      richness_multiplier = 150000,
      richness_base = 5000,
      size_control_multiplier = 0.06,
      peaks =
      {
        {
          influence = 0.1
        },
        {
          influence = 0.105,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
		{
		  influence = -0.99, 
		  max_influence = 0, 
		  noise_layer = "iron-vein", 
		  noise_octaves_difference = -2.3, 
		  noise_persistence = 0.45,
		},
        {
          influence = 0.67,
          noise_layer = "iron-ore",
          noise_octaves_difference = -2.7,
          noise_persistence = 0.3,
        }
      }
    },--]]
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0.337, g=0.419, b=0.427},
    map_grid = false
  },
  {
    type = "resource",
    name = "copper-vein",
    icon = "__base__/graphics/icons/crude-oil.png",
    flags = {"placeable-neutral"},
    category = "ore-vein",
    order="a-b-c",
    infinite = true,
    minimum = 1500,
    normal = 7500,
    minable =
    {
      hardness = 1,
      mining_time = 3,
      results =
      {
        {
          type = "item",
          name = "dirty-copper-ore",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    --[[autoplace =
    {
      control = "copper-vein",
      sharpness = 1,
      max_probability = 0.04,
      richness_multiplier = 150000,
      richness_base = 5000,
      size_control_multiplier = 0.06,
      peaks =
      {
        {
          influence = 0.1
        },
        {
          influence = 0.105,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
		{
		  influence = -0.99, 
		  max_influence = 0, 
		  noise_layer = "copper-vein", 
		  noise_octaves_difference = -2.3, 
		  noise_persistence = 0.45,
		},
        {
          influence = 0.67,
          noise_layer = "copper-ore",
          noise_octaves_difference = -2.7,
          noise_persistence = 0.3,
        }
      }
    },--]]
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0.803, g=0.388, b=0.215},
    map_grid = false
  },
    {
    type = "resource",
    name = "coal-vein",
    icon = "__base__/graphics/icons/crude-oil.png",
    flags = {"placeable-neutral"},
    category = "ore-vein",
    order="a-b-c",
    infinite = true,
    minimum = 1500,
    normal = 7500,
    minable =
    {
      hardness = 1,
      mining_time = 3,
      results =
      {
        {
          type = "item",
          name = "dirty-coal",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    --[[autoplace =
    {
      control = "coal-vein",
      sharpness = 1,
      max_probability = 0.04,
      richness_multiplier = 150000,
      richness_base = 5000,
      size_control_multiplier = 0.06,
      peaks =
      {
        {
          influence = 0.1
        },
        {
          influence = 0.105,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
		{
		  influence = -0.99, 
		  max_influence = 0, 
		  noise_layer = "coal-vein", 
		  noise_octaves_difference = -2.3, 
		  noise_persistence = 0.45,
		},
        {
          influence = 0.67,
          noise_layer = "coal",
          noise_octaves_difference = -2.7,
          noise_persistence = 0.3,
        }
      }
    },--]]
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0, g=0, b=0},
    map_grid = false
  }
})