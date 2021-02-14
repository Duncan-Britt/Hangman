require_relative 'hangman_game.rb'

def new_or_load_game
  puts  "Enter\n" +
        "'N' to start a new game or\n" +
        "'L' to load a saved game"

  case gets.chomp.downcase
  when 'n'
    HangmanGame.new
  when 'l'
    puts "entered l"
  else
    puts "invalid input"
    new_or_load_game
  end
end

new_or_load_game
