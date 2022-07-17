controller = {
	update = function(self)
		if dice_select_phase then
			if #dice == 3 then
				music_player:play(32)
			elseif #dice == 2 then
				music_player:play(36)
			elseif #dice == 1 then
				music_player:play(40)
			end
			

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
				sfx(56, -1, 0, 8)
				selected_die.is_selected = false
				index = (index + 1) % #dice
				if index == 0 then index = #dice end	
				selected_die = dice[index]
				selected_die.is_selected = true
			elseif btnp(0) then
				sfx(56, -1, 0, 8)
				selected_die.is_selected = false
				index = (index - 1) % #dice
				if index == 0 then index = #dice end
				selected_die = dice[index]
				selected_die.is_selected = true
			elseif btnp(5) then
				sfx(57, -1, 0, 8)
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
				sfx(56, -1, 0, 8)
				selected_activity.is_selected = false
				index = (index + 1) % #activities
				if index == 0 then index = #activities end	
				selected_activity = activities[index]
				selected_activity.is_selected = true
			elseif btnp(2) then
				sfx(56, -1, 0, 8)
				selected_activity.is_selected = false
				index = (index - 1) % #activities
				if index == 0 then index = #activities end
				selected_activity = activities[index]
				selected_activity.is_selected = true
			elseif btnp(5) then
				sfx(57, -1, 8, 8)
				activity_select_phase = false
				activity_play_phase = true
				activity_text_flag = true
				activity_music_flag = true
			end
		elseif activity_play_phase then
			if #dice == 3 then 
				music_player:play(4)
			else
				if activity_music_flag then
					activity_music_flag = false
					local rand_num = flr(rnd(2))
					if rand_num == 0 then
						music_player:play(4)
					else
						music_player:play(16)
					end
				end
			end
			local index
			for i=1,#activities,1 do
				if activities[i].is_selected then index = i end
			end

			local selected_activity = activities[index]

			local die_score = selected_activity.die.score

			foobar = die_score

			local outcome = get_outcome(die_score, selected_activity.outcomes)

			if activity_text_flag then
				activity_text_flag = false
				local prefix = "you rolled a: "..selected_activity.die.score.."! "
				textbox(prefix..outcome.text,nil,nil,7)


				meters[1].score = work_out_score(meters[1].score + (outcome.eng * 12))
				meters[2].score = work_out_score(meters[2].score + (outcome.sua * 12))
				meters[3].score = work_out_score(meters[3].score + (outcome.int * 12))
			end

			if btnp(5) then
				textbox('',nil,nil,7)
				selected_activity.is_selected = false
				add(todo_list.used_activities,copy_table(selected_activity))
				activities = remove_element(selected_activity, activities)

				activity_play_phase = false

				if #dice == 0 then
					boss_phase_eng = true
					boss_text_flag = true
				else
					dice_select_phase = true
				end
			end
		elseif boss_phase_eng then
			music_player:play(8)

			local text
			if meters[1].score >= 36 then
				text = boss_text.eng.high
			else
				text = boss_text.eng.low
			end

			if boss_text_flag then
				boss_text_flag = false
				textbox(text,nil,nil,7)
			end

			if btnp(5) then
				boss_phase_eng = false
				boss_phase_sua = true
				boss_text_flag = true
				-- start_game()
			end
		elseif boss_phase_sua then
			local text
			if meters[2].score >= 36 then
				text = boss_text.sua.high
			else
				text = boss_text.sua.low
			end

			if boss_text_flag then
				boss_text_flag = false
				textbox(text,nil,nil,7)
			end

			if btnp(5) then
				boss_phase_sua = false
				boss_phase_int = true
				boss_text_flag = true
			end
		elseif boss_phase_int then
			local text
			if meters[3].score >= 36 then
				text = boss_text.int.high
			else
				text = boss_text.int.low
			end

			if boss_text_flag then
				boss_text_flag = false
				textbox(text,nil,nil,7)
			end

			if btnp(5) then
				boss_phase_int = false
				final_phase = true
				final_text_flag = true
			end
		elseif final_phase then
			music_player:play(44)
			final_score = (meters[3].score + meters[2].score + meters[1].score)/3

			local text
			if final_score > 18 * 3 then
				text = final_text.high
			elseif final_score > 18 * 2 then
				text = final_text.mid_high
			elseif final_score > 18 then
				text = final_text.mid_low
			else
				text = final_text.low
			end

			if final_text_flag then
				final_text_flag = false
				textbox(text,nil,nil,7)
			end

			if btnp(5) then
				final_phase = false
				start_game()
			end
		end
	end
}