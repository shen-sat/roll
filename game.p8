pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
 game = {}
  profile = {
    x0 = 2,
    y0 = 2,
    width = 27,
    height = 27,
    border = 4,
    back_col = 2,
    front_col = 4,
    face_col = 15,
    face_details_col = 2,
    x1 = function(self)
      return calculate_x1(self.x0, self.width)  
    end,
    y1 = function(self)
      return calculate_y1(self.y0, self.height)  
    end,
    draw = function(self)
      -- back panel
      rectfill(self.x0,self.y0,self:x1(),self:y1(),self.back_col)
      -- face
      rectfill(self.x0 + self.border,self.y0 + self.border,self:x1() - self.border ,self:y1() - self.border,self.face_col)
    end
  }

  
  cha = {
    text = 'cha',
    score = 10
  }

  sta = {
    text = 'sta',
    score = 10
  }

  hea = {
    text = 'hea',
    score = 10
  }

  meters = {cha, sta, hea}

  stats_list = {
    x0 = 30,
    y0 = 2,
    x1 = function(self)
      return calculate_x1(self.x0, self.width)  
    end,
    y1 = function(self)
      return calculate_y1(self.y0, self.height)  
    end,
    width = 96,
    height = 27,
    front_border = 4,
    meters_text_border = 5,
    meters_bar_border = 18,
    meters_bar_height = 5,
    back_col = 2,
    front_col = 4,
    meters = meters,
    draw = function(self)
      -- back panel
      rectfill(self.x0,self.y0,self:x1(),self:y1(),self.back_col)
      -- front panel
      rectfill(self.x0 + self.front_border,self.y0 + self.front_border,self:x1() -self.front_border,self:y1() - self.front_border,self.front_col)
      
      local meter_y0 = self.y0 + self.meters_text_border
      local text_length = 12

      for meter in all(self.meters) do
        print(meter.text, self.x0 + self.meters_text_border, meter_y0, 7)
        rectfill(self.x0 + self.meters_bar_border,meter_y0,calculate_x1(self.x0 + self.meters_bar_border, meter.score),calculate_y1(meter_y0, self.meters_bar_height),7)
        meter_y0 += 6
      end
      
    end 
  }

  breakfast = {
    text = 'breakfast'
  }

  jogging = {
    text = 'jogging'
  }

  base_jumping = {
    text = 'base jumping'
  }

  activities = { breakfast, jogging, base_jumping }


  todo_list = {
    x0 = 2,
    y0 = 32,
    x1 = function(self)
      return calculate_x1(self.x0, self.width)  
    end,
    y1 = function(self)
      return calculate_y1(self.y0, self.height)  
    end,
    width = 124,
    height = 64,
    front_border = 4,
    back_col = 2,
    front_col = 4,
    activities_x_border = 14,
    activities_y_border = 10,
    dice_x_border = 95,
    dice_width = 14,
    activities = activities,
    draw = function(self)
      -- back panel
      rectfill(self.x0,self.y0,self:x1(),self:y1(),self.back_col)
      -- front panel
      rectfill(self.x0 + self.front_border,self.y0 + self.front_border,self:x1() -self.front_border,self:y1() - self.front_border,self.front_col)
      local activity_y0 = self.y0 + self.activities_y_border

      for activity in all(self.activities) do
        print(activity.text, self.x0 + self.activities_x_border, activity_y0, 1)
        rectfill(self.x0 + self.dice_x_border,activity_y0, calculate_x1(self.x0 + self.dice_x_border, self.dice_width),calculate_y1(activity_y0, self.dice_width),1)
        activity_y0 += 16
      end
    end
  }

  

  d1 = {
    x0 = 41,
    y0 = 98,
    score = 1,
    width = 14
  }
  d2 = {
    x0 = 57,
    y0 = 98,
    score = 1,
    width = 14

  }
  d3 = {
    x0 = 73,
    y0 = 98,
    score = 1,
    width = 14
  }

  dice = { d1, d2, d3 }

  instructions = 'select a die!'

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
  stats_list:draw()
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
