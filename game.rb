require_relative "snake"
class Game 
	attr_accessor :board
	def initialize
		create_board
		@snake=Snake.new()
		@user_input="d"
		@candy=[25,25]
		@command_array=['w','a','s','d','exit']
		# @last_command="d"
		# snake.position=[[0,0],[1,0],[2,0],[2,1],[2,2]]
		# @board[1][0]='-'
	end

	def run
		while @user_input!="exit"
			ready_fds = select [ $stdin ], [], [], 0.5
			if !ready_fds.nil?
				# if @command_array.include?(ready_fds.first.first.gets.chomp)
				@user_input=ready_fds.first.first.gets.chomp
				# end
				# p @user_input
			end
			system "clear"
			if @user_input=="d"
				move_right
				check_candy
			elsif @user_input=="s"
				move_down
				check_candy
			elsif @user_input=="a"
				move_left
				check_candy
			elsif @user_input=="w"
				move_up
				check_candy
			end
		end
	end

	def check_candy
		if @snake.position[@snake.position.length-1]==@candy
			@snake.grow
			@candy=[rand(1..28),rand(1..28)]
			while @snake.position.include?(@candy)
				@candy=[rand(1..28),rand(1..28)]
			end
		end
	end 

	def create_board
		@board=Array.new(30){Array.new(30," ")}
		@board[0]=Array.new(30,"-")
		@board[29]=Array.new(30,"-")
		28.times{|x|
			@board[1+x][0]="|"
			@board[1+x][29]="|"
		}
	end 

	def move_right
		create_board
		@snake.move_right
		add_snake_to_board
		print_board
	end 

	def move_down
		create_board
		@snake.move_down
		add_snake_to_board
		print_board
	end

	def move_up
		create_board
		@snake.move_up
		add_snake_to_board
		print_board
	end

	def move_left
		create_board
		@snake.move_left
		add_snake_to_board
		print_board
	end


	def add_snake_to_board
		@snake.position.each_with_index{|location_array,index|
			if index<(@snake.position.length-1)
				if same_row?({current_index:index,next_index:index+1})
					@board[location_array[0]][location_array[1]]="-"
				else
					@board[location_array[0]][location_array[1]]="|"
				end
			elsif (index-1)>0
				@board[location_array[0]][location_array[1]]=@board[@snake.position[index-1][0]][@snake.position[index-1][1]]
			else
				@board[location_array[0]][location_array[1]]="-"
			end
		}

		#add candy to board
		@board[@candy[0]][@candy[1]]="*"
	end

	def same_row?(args={})
		current_index=args[:current_index] 
		next_index=args[:next_index]
		if (@snake.position[next_index][0]-@snake.position[current_index][0])==0
			return true
		else
			return false
		end
	end

	# def print(input_array)
	# 	input_array.each{|row|
	# 		puts row.join("")
	# 	}
	# end 

	def print_board
		@board.each{|row|
			puts row.join("")
		}
	end
end 

game=Game.new()
game.add_snake_to_board
game.run
