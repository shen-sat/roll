-- d1 = {
--   x0 = 41,
--   y0 = 98,
--   score = 3,
--   width = 14,
--   is_selected = false
-- }
-- d2 = {
--   x0 = 57,
--   y0 = 98,
--   score = 1,
--   width = 14,
--   is_selected = false

-- }
-- d3 = {
--   x0 = 73,
--   y0 = 98,
--   score = 6,
--   width = 14,
--   is_selected = false
-- }

make_die = function(x, y, score)
  local die = {
    x0 = x,
    y0 = y,
    score = score,
    width = 14,
    is_selected = false
  }

  return die
end

d1 = make_die(41,98,3)
d2 = make_die(57,98,1)
d3 = make_die(73,98,6)


dice = { d1, d2, d3 }