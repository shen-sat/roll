pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
 game = {}
 #include profile.lua
 #include stats.lua
 #include todo_list.lua
 #include dice.lua
 #include instructions.lua

 start_game()


end

function _update()
 game.update()
end

function _draw()
 game.draw() 
end

function start_game()
  game.update = start_game_update
  game.draw = start_game_draw
end

function start_game_update()

end

function start_game_draw()
  cls(13)
  profile:draw()
  stats:draw()
  todo_list:draw()
  for die in all(dice) do
    rectfill(die.x0,die.y0,calculate_x1(die.x0, die.width),calculate_y1(die.y0,die.width),9)
  end
  print(instructions, 2, 128 - 6, 7)
end

function calculate_x1(x0, width)
  return x0 + width - 1
end

function calculate_y1(y0, height)
  return y0 + height - 1
end
