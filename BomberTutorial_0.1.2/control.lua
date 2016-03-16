require "util"
require "defines"

-- The code for FreeER's Step By Step Guide to Modding Factorio
-- (Created for Factorio 0.3.x Updated to 0.11.x) AKA Bomber Mod
function init() -- ran when the mod is first loaded
  global.bomber = 0 -- time placeholder
  global.version = "0.1.2"
end

script.on_init(init)
script.on_load(function() if not global.bomber then init() end end)

script.on_event(defines.events.on_tick, function(event) -- ran ~60 times per second
  -- if there are players in the game
  if #game.players > 0 then
    -- then loop through all of them and...
    for _, player in ipairs(game.players) do
      -- if this player has a character (as opposed to being in a sandbox game)
      -- and that character is in a vehicle and that vehicle is our bomber
      -- and that bomber has at least 1 bomb item in it's inventory
      -- and it's been more than 180 ticks (3 seconds) since the last bombing
      if player.character and player.character.vehicle
      and player.character.vehicle.name == "bomber"
      and player.character.vehicle.get_inventory(2).get_item_count("bomb") >= 1
      and event.tick-global.bomber >= 180 then -- delay of 3 seconds per drop
        local bomber = player.character.vehicle -- reference to bomber
        local bombArea = game.surfaces["nauvis"].find_entities{ -- area to 'bomb'
          { -- rectangular area to search by specifying bottomleft and topright xy
            bomber.position.x-5,
            bomber.position.y-5
          },
          {
            bomber.position.x+5,
            bomber.position.y+5
          }
        }
        
        local drop = false -- boolean determining whether we should 'drop' a bomb
        local enemyCount = 0 -- number of biters in bombArea
        
        for index, enemy in pairs(bombArea) do -- loop over entities in bombArea
          if enemy.force.name == 'enemy' then -- if it actually is an enemy
            if enemy.type == 'spawner' then -- count spawners as a priority
              drop = true
              break; -- stop looping now that we know we will drop a bomb
            elseif enemy.type == 'unit' or enemy.type == 'turret' then
              enemyCount = enemyCount + 1 -- count units and worms as 1 'enemy'
              if enemyCount > 5 then -- if five or more will be killed then drop
                drop = true
                break; -- stop looping
              end
            end
          end
        end
        
        if drop then -- if we decided to drop a bomb
          global.bomber = event.tick -- store the time we dropped a bomb
          for index, entity in pairs(bombArea) do
            if entity.force.name == 'enemy' then
              if entity.health then -- if it has health
                entity.die() -- make it die
              else -- no health, so no die method to call
                entity.destroy() -- use destroy
              end
            end
          end
          -- now remove the 'dropped' bomb from the bomber's inventory
          bomber.get_inventory(2).remove{name="bomb", count=1}
        end
      
      end
    end
  end
end)