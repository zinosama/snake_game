class Snake
	attr_accessor :position
	def initialize
		@position=[[1,1],[2,1],[3,1],[3,2],[3,3]]
	end

	def grow
		@position.unshift(@position[0])
	end 

	def move_right
		index=0
 		while index<=(@position.length-2)
 			@position[index]=@position[index+1].dup
 			index+=1
 		end 
 		@position[@position.length-1][1]=@position[@position.length-1][1]+1
	end

	def move_down
		index=0
		while index<=(@position.length-2)
 			@position[index]=@position[index+1].dup
 			index+=1
 		end 
 		@position[@position.length-1][0]=@position[@position.length-1][0]+1
	end 

	def move_up
		index=0
		while index<=(@position.length-2)
			@position[index]=@position[index+1].dup
			index+=1
		end 
		@position[@position.length-1][0]=@position[@position.length-1][0]-1
	end 

	def move_left
		index=0
		while index<=(@position.length-2)
			@position[index]=@position[index+1].dup
			index+=1
		end 
		@position[@position.length-1][1]=@position[@position.length-1][1]-1
	end 
end