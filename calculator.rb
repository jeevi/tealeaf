
def say(msg)
	puts "=> #{msg}"
end

def is_a_number?(arr)
  arr.each do |char|
    ascii_val = char.ord
    if !ascii_val.between?(48,57); return false end
  end
  true
end

def is_a_floating_point?(arr)
  # number could be a floating point
  points = arr.select {|e| e == "."}
  not_a_valid_number = false
  if points.length == 1
    # float has only one decimal point
    arr.delete(".")
    not_a_valid_number |= !is_a_number?(arr)
  else
    # invalid entry
    not_a_valid_number |= true
  end
  not_a_valid_number
end

def parse_entry(nth_number)
  begin
  	say "Enter the #{nth_number} number"
  	number = gets.chomp
    individual_chars = number.chars
    not_a_valid_number  = false
    if individual_chars.include? "."
      not_a_valid_number |= is_a_floating_point?(individual_chars)
    else
      # not a float, could be an integer
      not_a_valid_number |= !is_a_number?(individual_chars)
    end
  end while not_a_valid_number
  number
end

begin
  first_number = parse_entry("first")
  second_number = parse_entry("second")

  say "\n\nchoose one of the following \n 1) addition \n 2) subtraction  
      3) multiplication \n 4)division\n\n"

  operator = gets.chomp
  result = nil

  case operator.to_i

    when 1
      result = first_number.to_f + second_number.to_f
    
    when 2
      result = first_number.to_f - second_number.to_f

    when 3
      result = first_number.to_f * second_number.to_f

    when 4
      result = first_number.to_f / second_number.to_f

    else
      puts "\n\nInvalid entry\n\n"
  end

  result.infinite? == 1 ? (puts "\nResult is Infinity\n") : \
  result.floor == result ? (puts result.to_i) : (puts result)

  say "Would you like to have fun again? (y/n)"
  choice = gets.chomp

end while choice == 'y' || choice == 'Y'
