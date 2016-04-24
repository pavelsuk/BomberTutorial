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
          filename = "__BomberTutorial__/graphics/sheet_bomber.png",
          line_length = 8,
          width = 105,
          height = 106,
          frame_count = 1,
          direction_count = 16,
          animation_speed = 8,
        }
            

          }
        
          
                  
        },
                 
   
      rotation_speed = 0.005,
      weight = 50,
      inventory_size = 12
  }
})
