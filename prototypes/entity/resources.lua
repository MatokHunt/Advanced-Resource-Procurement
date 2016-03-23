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
  },
	{
    type = "resource",
    name = "oil-well",
    icon = "__base__/graphics/icons/crude-oil.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order="a-b-b",
    infinite = true,
    minimum = 1,
    normal = 1,
    minable =
    {
      hardness = 1,
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "crude-oil",
          amount_min = 0,
          amount_max = 0,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
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
  }
})