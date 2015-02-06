def say(msg)
  puts "\n\n~~~~~~~~~~~~ #{msg} ~~~~~~~~~~~~\n\n"
end

def get_random_index
  rand_instance = Random.new
  rand_instance.seed
  rand_instance.rand(100) % 3
end

options = ['Rock', 'Paper', 'Scissors']

say "Welcome to Rock/Paper/Scissors"

begin
  begin
    say "Choose one of the following: Rock(1) / Paper(2) / Scissors(3)"
    choice = gets.chomp
    choice_ascii_val = choice.ord
  end while !choice_ascii_val.between?(49,51)

  user_choice = options[choice.to_i - 1]
  nemesis_choice = options[get_random_index]

  say "\n\nYou chose #{user_choice}, you nemesis chose #{nemesis_choice}\n\n"

  case user_choice
     when 'Rock'
      case nemesis_choice
        when 'Paper'
          say "YOU LOSE!"
        when 'Rock'
          say "IT'S A DRAW"
        else
          say "YOU WIN"
      	end
    when 'Paper'
      case nemesis_choice
        when 'Scissors'
          say "YOU LOSE!"
        when 'Paper'
          say "IT'S A DRAW"
        else
          say "YOU WIN"
      	end
    when 'Scissors'
      case nemesis_choice
        when 'Rock'
          say "YOU LOSE!"
        when 'Scissors'
          say "IT'S A DRAW"
        else
          say "YOU WIN"
      	end
    end 
  say "Play again? (y/n)"
  continue = gets.chomp
end while continue.downcase == 'y'
