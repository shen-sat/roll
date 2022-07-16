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

stats = {
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