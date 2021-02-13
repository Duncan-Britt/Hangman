puts "Hangman initialized"

dictionary = File.read('5desk.txt')
puts dictionary

def pick_random_line
  chosen_line = nil
  File.foreach("5desk.txt").each_with_index do |line, number|
    if line.length > 5 && line.length < 12
      chosen_line = line.chomp if rand < 1.0/(number+1)
    end
  end
  return chosen_line
end

secret_word = pick_random_line

puts "random line is '#{secret_word}'\n" +
     "char length is #{secret_word.length}"
