class Hangman
  def initialize
    @word_length = Random.new.rand(5..7)
    @secret_word = ""
    @dictionary = []
    @number_of_guesses = 8
    @current_state = "_ " * @number_of_guesses
  end

  # Get dictionary
  def set_dictionary
    contents = File.read("dictionary.txt").split("\n")
    @dictionary = contents.filter { |word| word.length == @word_length}
  end

  # ramdonly select a word and set as secret word
  def computer_selects_word
    @secret_word = @dictionary[Random.new.rand(@dictionary.length)]
  end

  def display_word
    puts @current_state
  end

  def player_guess
    puts "You have #{@number_of_guesses} remaining..."
    puts "Guess a letter"
    guess = gets.chomp

    @number_of_guesses -= 1
  end
  
  def play_game
    set_dictionary
    computer_selects_word
    
    puts "The computer has selected an impossible word of #{@word_length} letters."
    puts "You have #{@number_of_guesses} attempts to guess the word."
    puts "Good luck."
    puts "-----------------------"

    display_word
  end
  
end

game = Hangman.new
game.play_game


