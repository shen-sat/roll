breakfast = {
  text = 'breakfast',
  is_selected = false,
  die = {
    score,
    x0,
    y0
  }
}

jogging = {
  text = 'jogging',
  is_selected = false,
  die = {
    score,
    x0,
    y0
  }
}

base_jumping = {
  text = 'base jumping',
  is_selected = false,
  die = {
    score,
    x0,
    y0
  }
}

-- iron_clothes = {
--   text = 'iron clothes',
--   is_selected = false,
--   die = {
--     score,
--     x0,
--     y0
--   }
-- }

-- place_dice_games = {
--   text = 'place dice games',
--   is_selected = false,
--   die = {
--     score,
--     x0,
--     y0
--   }
-- }


create_activity = function(text)
  local activity = {
    text = text,
    is_selected = false,
    die = {
      score,
      x0,
      y0 
    }
  }

  return activity
end

all_activities = {
  create_activity('breakfast'),
  create_activity('jogging'),
  create_activity('base jumping'),
  create_activity('iron clothes'),
  create_activity('place dice games'),
  create_activity('do washing up')
}

pick_activities = function()
  local result = {}

  local num = #all_activities
  local index = flr(rnd(num)) + 1
  local activity = all_activities[index]
  add(result, activity)
  all_activities = remove_element(activity,all_activities)

  num = #all_activities
  index = flr(rnd(num)) + 1
  activity = all_activities[index]
  add(result, activity)
  all_activities = remove_element(activity,all_activities)

  num = #all_activities
  index = flr(rnd(num)) + 1
  activity = all_activities[index]
  add(result, activity)
  all_activities = remove_element(activity,all_activities)

  return result
end

activities = pick_activities()


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
  used_activities = {},
  die,
  draw = function(self)
    -- back panel
    rectfill(self.x0,self.y0,self:x1(),self:y1(),self.back_col)
    -- front panel
    rectfill(self.x0 + self.front_border,self.y0 + self.front_border,self:x1() -self.front_border,self:y1() - self.front_border,self.front_col)
    local activity_y0 = self.y0 + self.activities_y_border
    local die_x0 = self.x0 + self.dice_x_border
    -- active activities
    for activity in all(self.activities) do
      print(activity.text, self.x0 + self.activities_x_border, activity_y0, 1)
      -- dice holes
      rectfill(die_x0,activity_y0, calculate_x1(die_x0, self.dice_width),calculate_y1(activity_y0, self.dice_width),1)

      if activity.is_selected then
        rectfill(die_x0,activity_y0, calculate_x1(die_x0, self.dice_width),calculate_y1(activity_y0, self.dice_width),7)
        print(self.die.score, die_x0, activity_y0, 0)
        -- add these values to objects in case we convert it into a used activity 
        activity.die.x0 = die_x0
        activity.die.y0 = activity_y0
        if self.die then activity.die.score = self.die.score end
      end
      
      activity_y0 += 16
    end
    -- used activities
    for used_activity in all(self.used_activities) do
      rectfill(used_activity.die.x0,used_activity.die.y0, calculate_x1(used_activity.die.x0, self.dice_width),calculate_y1(used_activity.die.y0, self.dice_width),9)
      print(used_activity.die.score, used_activity.die.x0, used_activity.die.y0, 0)
    end
  end
}