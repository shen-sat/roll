create_activity = function(text,outcomes)
  local activity = {
    text = text,
    is_selected = false,
    desc = "dummy text for: "..text,
    die = {
      score,
      x0,
      y0 
    },
    outcomes = outcomes
  }

  return activity
end

all_activities = {
  create_activity('breakfast', breakfast_outcomes),
  create_activity('jogging', jogging_outcomes),
  create_activity('base jumping', base_jumping_outcomes),
  create_activity('iron clothes', ironing_outcomes),
  create_activity('place dice games', play_dice_games_outcomes),
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