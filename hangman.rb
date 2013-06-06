class Hangman
	LIST = ["canada", "england", "australia", "japan"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer

class InvalidGuessException < Exception ### herda toda a classe Exception. so cria essa classe
                                        ### nao gerar um erro geral -> todos os erros/bugs aparecerem no raise  
end
  def initialize()
    @chances = 8
    @guesses = []
    @word    = LIST.choice #sample pega um exemplo randomico da array
    @board   = draw_board(@word)
    puts @word
  end

  # return @guesses as a string
  def guesses
    @guesses.join('') ### transforma array em uma string
  end
  
 

  # decrement # of chances and add letter to guesses
  def wrong_letter(letter)
  	@chances -= 1 ### diminui o numero de chances
    @guesses << letter ### include the wrong letter into the guesses array
  end
  
  

  # if the word has the given letter, put it on the board, otherwise, it's a wrong guess
  def guess(letter)
    raise InvalidGuessException.new("Invalid Guess!") unless valid_guess?(letter) ### raise lida com excessao e quebra o codigo
    ###  raise "Invalid guess!" =  raise Exception.new("Invalid guess!")
    if word_has?(letter)
    	put_letter_on_board(letter)
    else
      wrong_letter(letter) if !@guesses.include? letter
    end
  end

  # return true if @board doesn't have a '_', otherwise return false
  def win?
    !@board.include? '_' ### if the board does not include '_'
  end

  # return true if @chances is 0, otherwise return false
  def lost?
      @chances == 0
  end
  
  def valid_guess? (letter)
    letter.length == 1
  end
   # replace indexes of @board with letter where the same indexes of @word are letter
  # in other words, if @board is _ _ _ _ _ _ and @word is canada
  # and the letter guessed is a
  # then @board should become _ a _ a _ a
  
  def put_letter_on_board(letter) ###only call if the letter exists
    for i in (0..@word.length)
      @board[i] = letter if @word[i] == letter ### o "i" nesse caso é equivalente ao index. checa o index
    end
  end
          ### mesta coisa que o de cima  -- tentar com each_with_index depois
          ### if @word[i] == letter
          ###    @board[1]


          ### each_with_index
          ### word_array.each_with_index do |letter, index|
          ###   if vowel.include?(letter)
          ###     puts letter
          ###     ### to add a num to a string we have to make it a string
          ###     start_of_second_part = index
          ###     puts "The index that was stopped at was: " + index.to_s

          ###     break
          ###   end
          ###   puts letter
          ### end
    


  # return true if word has letter
  def word_has?(letter) ###the method doesn't need the ? but it's just convention when use boolean
    @word.include? letter
  end

 # return a string of underscores equal to length of the given word
  def draw_board(word)
    "_" * @word.length

  end

  #private #### evita que esses metodos sejam acessados fora da classe€

 #  def valid_guess? (letter)
 #    letter.length == 1
 #  end
 #   # replace indexes of @board with letter where the same indexes of @word are letter
 #  # in other words, if @board is _ _ _ _ _ _ and @word is canada
 #  # and the letter guessed is a
 #  # then @board should become _ a _ a _ a
 #  def put_letter_on_board(letter) ###only call if the letter exists
 #    for i in (0..@word.length)
 #      @board[i] = letter if @word[i] == letter ### o "i" nesse caso é equivalente ao index. checa o index
 #    end
 #  end
 #          ### mesta coisa que o de cima  -- tentar com each_with_index depois
 #          ### if @word[i] == letter
 #          ###    @board[1]


 #          ### each_with_index
 #          ### word_array.each_with_index do |letter, index|
 #          ###   if vowel.include?(letter)
 #          ###     puts letter
 #          ###     ### to add a num to a string we have to make it a string
 #          ###     start_of_second_part = index
 #          ###     puts "The index that was stopped at was: " + index.to_s

 #          ###     break
 #          ###   end
 #          ###   puts letter
 #          ### end
    


 #  # return true if word has letter
 #  def word_has?(letter) ###the method doesn't need the ? but it's just convention when use boolean
 #    @word.include? letter
 #  end

 # # return a string of underscores equal to length of the given word
 #  def draw_board(word)
 #    "_" * word.length

 #  end
end
