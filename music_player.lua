music_player = {
	start_play = false,
	track,
	play = function(self,num)
		if not (self.track == num)  then
			self.track = num
			self.start_play = true
		end
	end,
	update = function(self)
		if self.start_play then
			music(self.track)
			self.start_play = false
		end
		

	end
}