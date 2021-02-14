require_relative 'hangman_game.rb'
require 'yaml'

def new_or_load_game
  puts  "Enter\n" +
        "'N' to start a new game or\n" +
        "'L' to load a saved game"

  case gets.chomp.downcase
  when 'n'
    b = HangmanGame.new
    b.round_loop
  when 'l'
    load_game
  else
    puts "invalid input"
    new_or_load_game
  end
end

def load_game
  begin
  a = file_info[0]
  a.round_loop
  rescue
    puts "No such file exists"
    new_or_load_game
  end
end

def file_info
  saves = Dir.entries('saved_games')
  saves = saves.join("\n")
  saves = saves.gsub('.yml', '')
  p saves
  puts  "saved games: #{saves}\n" +
        "Enter the name of the game you'd like to load"
  output = File.new("saved_games/#{gets.chomp}.yml", 'r')
  saved_game = YAML.load(output.read)
  output.close
  saved_game
end

new_or_load_game
