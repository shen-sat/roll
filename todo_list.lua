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