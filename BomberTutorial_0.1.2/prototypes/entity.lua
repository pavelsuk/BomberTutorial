data:extend({
  {
      type = "car",
      name = "bomber",
      icon = "__BomberTutorial__/graphics/icon_bomber.png",
      flags = {"pushable", "placeable-neutral", "player-creation"},
      minable = {mining_time = 1, result = "bomber"},
      max_health = 2000,
      corpse = "medium-remnants",
      energy_per_hit_point = 1,
      selection_box = {{-0.7, -1.2}, {0.7, 1.2}},
      collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
      collision_mask = {}, -- empty table means collides with nothing
      breaking_speed = 0.09,
      effectivity = 0.5, -- 1/2 of power that gets to car goes to wheels?
      braking_power = "20kW",
      burner = 
        {
          effectivity = 0.1, -- 1/10 of consumption power gets to car
          emissions = 20,
          fuel_inventory_size = 2,
        },
      consumption = "250J",
      friction = 0.00001,
      animation =
      {
        layers =
        {
          {
            width = 102,
            height = 86,
            frame_count = 2,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -0.1875},
            animation_speed = 8,
            max_advance = 0.2,
            stripes =
            {
              {
               filename = "__base__/graphics/entity/car/car-1.png",
               width_in_frames = 2,
               height_in_frames = 22,
              },
              {
               filename = "__base__/graphics/entity/car/car-2.png",
               width_in_frames = 2,
               height_in_frames = 22,
              },
              {
               filename = "__base__/graphics/entity/car/car-3.png",
               width_in_frames = 2,
               height_in_frames = 20,
              },
            }
          },
          {
            width = 100,
            height = 75,
            frame_count = 2,
            apply_runtime_tint = true,
            axially_symmetrical = false,
            direction_count = 64,
            max_advance = 0.2,
            line_length = 2,
            shift = {0, -0.171875},
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/car/car-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 22,
              },
              {
                filename = "__base__/graphics/entity/car/car-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 22,
              },
              {
                filename = "__base__/graphics/entity/car/car-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 20,
              },
            })
          },
          {
            width = 114,
            height = 76,
            frame_count = 2,
            draw_as_shadow = true,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0.28125, 0.25},
            max_advance = 0.2,
            stripes = util.multiplystripes(2,
            {
             {
              filename = "__base__/graphics/entity/car/car-shadow-1.png",
              width_in_frames = 1,
              height_in_frames = 22,
             },
             {
              filename = "__base__/graphics/entity/car/car-shadow-2.png",
              width_in_frames = 1,
              height_in_frames = 22,
             },
             {
              filename = "__base__/graphics/entity/car/car-shadow-3.png",
              width_in_frames = 1,
              height_in_frames = 20,
             },
            })
          }
        }
    },
      rotation_speed = 0.005,
      weight = 50,
      inventory_size = 12
  }
})
