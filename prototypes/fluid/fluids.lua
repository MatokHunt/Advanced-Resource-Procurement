data:extend(
{
  {
    type = "fluid",
    name = "natural-gas",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0.3, g=0.3, b=0},
    flow_color = {r=0.5, g=0.5, b=0.0},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "b[fluid]-f[natural-gas]"
  },
  {
    type = "fluid",
    name = "waste-water",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0.3, g=0.3, b=0},
    flow_color = {r=0.5, g=0.5, b=0.0},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "b[fluid]-g[waste-water]"
  }
}
)