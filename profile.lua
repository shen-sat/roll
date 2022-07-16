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