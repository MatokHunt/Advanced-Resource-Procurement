data:extend(
{
  {
    type = "recipe",
    name = "deep-bore-drill",
    energy_required = 20,
    ingredients =
    {
      {"iron-plate", 1}
    },
    result = "deep-bore-drill"
  },
  {
    type = "recipe",
    name = "drill-rig",
    energy_required = 20,
    ingredients =
    {
      {"iron-plate", 1}
    },
    result = "drill-rig"
  },
  {
    type = "recipe",
    name = "drill-bit",
    energy_required = 20,
    ingredients =
    {
		  {"iron-stick", 6},
      {"steel-plate", 5}
    },
    result = "drill-bit"
  },
  {
    type = "recipe",
    name = "drill-oil-well",
		category = "drilling",
    energy_required = 100,
    ingredients =
    {
		  {type="fluid", name="water", amount=10},
      {type="item", name="drill-bit", amount=1}
    },
    results =
    {
			{type="fluid", name="waste-water", amount=8}
		},
		icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-z[drill-oil-well]"
  }
}
)