make_die = function(x, y)
  local die = {
    x0 = x,
    y0 = y,
    score = flr(rnd(6)) + 1,
    width = 14,
    is_selected = false
  }

  return die
end

make_and_roll_dice = function()
  d1 = make_die(41,98)
  d2 = make_die(57,98)
  d3 = make_die(73,98)

  return {d1, d2, d3 }
end

dice = make_and_roll_dice()