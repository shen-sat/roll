controller = {
	update = function(self)
		if dice_select_phase then
			-- check all dice for is_selected flag
			local index
			for i=1,#dice,1 do
				if dice[i].is_selected then index = i end
			end

			local selected_die
			if index then
				selected_die = dice[index]
			else
				index = 1
				selected_die = dice[index]
				selected_die.is_selected = true
			end

			if btnp(1) then
				selected_die.is_selected = false
				index = (index + 1) % #dice
				if index == 0 then index = #dice end	
				selected_die = dice[index]
				selected_die.is_selected = true
			elseif btnp(0) then
				selected_die.is_selected = false
				index = (index - 1) % #dice
				if index == 0 then index = #dice end
				selected_die = dice[index]
				selected_die.is_selected = true
			elseif btnp(5) then
				todo_list.die = copy_table(selected_die)
				dice = remove_element(selected_die, dice)
				dice_select_phase = false
				activity_select_phase = true
			end
		elseif activity_select_phase then
			local index
			for i=1,#activities,1 do
				if activities[i].is_selected then index = i end
			end

			local selected_activity
			if index then
				selected_activity = activities[index]
			else
				index = 1
				selected_activity = activities[index]
				selected_activity.is_selected = true
			end

			if btnp(3) then
				selected_activity.is_selected = false
				index = (index + 1) % #activities
				if index == 0 then index = #activities end	
				selected_activity = activities[index]
				selected_activity.is_selected = true
			elseif btnp(2) then
				selected_activity.is_selected = false
				index = (index - 1) % #activities
				if index == 0 then index = #activities end
				selected_activity = activities[index]
				selected_activity.is_selected = true
			elseif btnp(5) then
				-- submit die score with activity
				selected_activity.is_selected = false
				add(todo_list.used_activities,copy_table(selected_activity))
				activities = remove_element(selected_activity, activities)

				dice_select_phase = true
				activity_select_phase = false
			end
		end
	end
}