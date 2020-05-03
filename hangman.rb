class Hangman
  def initialize
    @word_length = Random.rand(5..7)
    @secret_word = ""
    @dictionary = []
  end

  # Get dictionary
  def set_dictionary
    contents = File.read("dictionary.txt").split("\n")
    @dictionary = contents.filter { |word| word.length == @word_length}
  end

  # ramdonly select a word and set as secret word
  def computer_selects_word
    @secret_word = @dictionary[Random.rand(@dictionary.length)]
  end
  puts @secret_word
end

game = Hangman.new
game.set_dictionary


