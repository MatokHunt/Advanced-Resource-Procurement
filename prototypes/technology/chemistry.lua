 data:extend(
{
  {
    type = "technology",
    name = "advanced-ore-processing",
    icon = "__base__/graphics/technology/oil-processing.png",
    prerequisites = {"oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dirty-iron-ore-washing"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1},
                     {"science-pack-2", 1},
                     {"science-pack-3", 1}},
      time = 30
    },
    order = "d-f"
  },
  {
    type = "technology",
    name = "advanced-recovery-techniques",
    icon = "__base__/graphics/technology/oil-processing.png",
    prerequisites = {"oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dirty-iron-ore-washing"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1},
                     {"science-pack-2", 1},
                     {"science-pack-3", 1}},
      time = 30
    },
    order = "d-g"
  },
}
)