data:extend(
{  
  {
    type = "item",
    name = "deep-bore-drill",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "a[items]-z[deep-bore-drill]",
    place_result = "deep-bore-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "drill-rig",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "a[items]-z[drill-rig]",
    place_result = "drill-rig",
    stack_size = 50
  },
  {
    type = "item",
    name = "drill-rig-near-water",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "a[items]-z[drill-rig-near-water]",
    place_result = "drill-rig-near-water",
    stack_size = 50
  },
  {
    type = "item",
    name = "drill-rig-near-wells",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "a[items]-z[drill-rig-near-wells]",
    place_result = "drill-rig-near-wells",
    stack_size = 50
  },
  {
    type = "item",
    name = "drill-bit",
    icon = "__base__/graphics/icons/engine-unit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "z[drill-bit]",
    stack_size = 5
  }
}
)