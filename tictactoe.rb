class Tictactoe
attr_accessor :board, :entry, :player1, :player2, :position, :played, :game, :champion

	def initialize()
			@board = [1,2,3,4,5,6,7,8,9]
  		@player1 = 'X'
			@player2 = 'O'
			@entry = nil
			@played = []

			@champion = nil

  	end


  	def fill_board_in_with_positions
		 	@board.each_index do |index| 
		 		@board[index] = index + 1
			end
  	end

  	def draw_board

  		puts @board[0].to_s  + " | " + @board[1].to_s  + " | " + @board[2].to_s 
		  puts "__________"
		  puts @board[3].to_s + " | " + @board[4].to_s  + " | " + @board[5].to_s
		  puts "__________"
		  puts @board[6].to_s  + " | " + @board[7].to_s + " | " + @board[8].to_s 

  	end

	def get_a_number
		@entry = Integer(gets.chomp) 
	end


	def store_number		
		@played << get_a_number
	end


	def mark_x_replace_number
		@board[@entry-1] = @player1
		 # it's replacing number with x not in the draw board
	 draw_board	
	end

	def mark_o_replace_number
		@board[@entry-1] = @player2
	 draw_board	
	end


def check_winners
	if 		@board[0] == 'X' && @board[1] == 'X' && @board[2] == 'X'||
		 		@board[3] == 'X' && @board[4] == 'X' && @board[5] == 'X'||
		 		@board[6] == 'X' && @board[7] == 'X' && @board[8] == 'X'||
		 		@board[0] == 'X' && @board[3] == 'X' && @board[6] == 'X'||
		 		@board[1] == 'X' && @board[4] == 'X' && @board[7] == 'X'||
		 		@board[2] == 'X' && @board[5] == 'X' && @board[8] == 'X'||
		 		@board[0] == 'X' && @board[4] == 'X' && @board[8] == 'X'||
		 		@board[2] == 'X' && @board[4] == 'X' && @board[6] == 'X' 

		 		@champion = "Player 1"

	elsif @board[0] == 'O' && @board[1] == 'O' && @board[2] == 'O'||
		 		@board[3] == 'O' && @board[4] == 'O' && @board[5] == 'O'||
		 		@board[6] == 'O' && @board[7] == 'O' && @board[8] == 'O'||
		 		@board[0] == 'O' && @board[3] == 'O' && @board[6] == 'O'||
		 		@board[1] == 'O' && @board[4] == 'O' && @board[7] == 'O'||
		 		@board[2] == 'O' && @board[5] == 'O' && @board[8] == 'O'||
		 		@board[0] == 'O' && @board[4] == 'O' && @board[8] == 'O'||
		 		@board[2] == 'O' && @board[4] == 'O' && @board[6] == 'O' 

				@champion = "Player 2"
		

	end
end

def player_one_win?
	return false
end


 def play_game
 	draw_board

 	while true
 		puts "Player 1, pick a number: "
 		store_number
 		mark_x_replace_number

 	  check_winners

	 	 if @champion
	 	 	# this should be called if player 1 wins
	 		puts "#{@champion} Wins!"
	 		return
	 	 end
 		
		puts "Player 2, pick a number: "
		store_number
		mark_o_replace_number
	
	 check_winners

	  if @champion
	  	#this gets called if player 2 wins
	  	puts "#{@champion} wins!"
	  	return
	  end 	
 	end
 end

end

tictactoe = Tictactoe.new
tictactoe.play_game






		

