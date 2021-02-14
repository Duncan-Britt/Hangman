class HangmanGame
  attr_accessor :incorrect_guess_count, :false_guesses, :correct_guesses
  attr_reader :secret_word

  def initialize
    @secret_word = pick_random_line
    @incorrect_guess_count = 0
    @false_guesses = []
    @correct_guesses = []
    # puts "\nSecret word is #{secret_word}"
    round_loop
  end

  def round_loop
    until incorrect_guess_count == secret_word.length
      output
      if clues == secret_word
        puts "You guessed it!"
        return
      end
      round
    end
    puts  "\nYou lose!\n" +
          "the word was #{secret_word}"
  end

  def round
    guess = get_guess
    if secret_word.downcase.include?(guess)
      correct_guesses << guess
    else
      false_guesses << guess
      self.incorrect_guess_count += 1
    end
  end

  def output
    puts  "\nFalse guesses: #{false_guesses.join(' ')}\n" +
          "Correct guesses #{correct_guesses.join(' ')}\n" +
          "Secret word: #{clues}"
  end

  def clues
    blanks = []
    secret_word.length.times do
      blanks << '_'
    end
    correct_guesses.each do |guess|
      if secret_word.downcase.include?(guess)
        guess.split('').each do |gch|
          secret_word.downcase.split('').each_with_index do |char, idx|
            if char == gch
              blanks[idx] = secret_word.split('')[idx]
            end
          end
        end
      end
    end
    blanks.join('')
  end

  def pick_random_line
    chosen_line = nil
    File.foreach("5desk.txt").each_with_index do |line, number|
      if line.length > 5 && line.length < 12
        chosen_line = line.chomp if rand < 1.0/(number+1)
      end
    end
    chosen_line
  end

  def get_guess
    puts "Guess a letter or substring"
    validate(gets.chomp.downcase)
  end

  def validate(input)
    if input =~ /[a-z]/
      if false_guesses.join(' ').include?(input) || correct_guesses.join(' ').include?(input)
        puts "You've already guessed that!"
        get_guess
      else
        input
      end
    else
      puts "Invalid input. Do not use spaces, numbers or special characters"
      get_guess
    end
  end

end
