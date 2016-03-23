data:extend(
{
  {
    type = "recipe",
    name = "dirty-iron-ore-washing",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
	  {type="item", name="dirty-iron-ore", amount=1},
      {type="fluid", name="water", amount=5}
    },
    results=
    {
      {type="fluid", name="waste-water", amount=4},
      {type="item", name="iron-ore", amount=3}
    },
    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-z[dirty-iron-ore-washing]"
  }
}
)