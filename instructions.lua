instructions = {
	text,
	update = function(self)
		if dice_select_phase then
			self.text = 'pick a die and press x'
		elseif activity_select_phase then
			self.text = 'pick an activity and press x'
		elseif #dice == 0 and activity_play_phase then
			self.text = 'press x to go to interview'
		elseif final_phase then
			self.text = 'press x to replay'
		else
			self.text = 'press x to continue'
		end
	end
}




