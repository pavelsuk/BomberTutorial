data:extend({
  {
      type = "technology",
      name = "bombertech",
      icon = "__BomberTutorial__/graphics/icon_bomber_tech.png",
      effects =
      {
        {
            type = "unlock-recipe",
            recipe = "bomber"
        },
        {
            type = "unlock-recipe",
            recipe = "bomb"
        }
      },
      prerequisites = {"flying"},
      unit =
      {
        count = 10,
        ingredients =
        {
          {"science-pack-1", 2},
          {"science-pack-2", 1},
          {"science-pack-3", 1}
        },
        time = 20
      }
  }
})