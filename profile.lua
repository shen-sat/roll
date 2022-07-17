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
    -- eyes
    -- rectfill(12,13,13,14,2)
    rectfill(11,11,14,14,2)
    rectfill(16,11,19,14,2)
    -- mouth
    line(10,17,20,17)
  end
}