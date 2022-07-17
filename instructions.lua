instructions = {
	text,
	update = function(self)
		if dice_select_phase then
			self.text = 'pick a die and press x'
		elseif activity_select_phase then
			self.text = 'pick an activity and press x'
		elseif activity_play_phase then
			self.text = 'press x to continue'
		elseif boss_phase then
			self.text = 'press x to replay'
		end
	end
}




