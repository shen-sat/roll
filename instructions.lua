instructions = {
	text,
	update = function(self)
		if dice_select_phase then
			self.text = 'select a die!'
		elseif activity_select_phase then
			self.text = 'choose an activity!'
		end
	end
}




