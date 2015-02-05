def say(msg)
	puts "=> #{msg}"
end

def check_if_number(arr)
  arr.each do |char|
    ascii_val = char.ord
    if !ascii_val.between?(48,57); return false end
  end
  true
end

def parse_entry(nth_number)
  begin
  	say "Enter the #{nth_number} number"
  	number = gets.chomp
    individual_chars = number.chars
    #if individual_chars[0] == "-"; individual_chars.delete("-") end
    flag  = false
    if individual_chars.include? "."
      # number could be a floating point
      points = individual_chars.select {|e| e == "."}
      if points.length == 1
        # float has only one decimal point
        individual_chars.delete(".")
        flag |= !check_if_number(individual_chars)
      else
        # invalid entry
        flag |= true
      end
    else
      # not a float, could be an integer
      flag |= !check_if_number(individual_chars)
    end
  end while flag
  number
end

num1 = parse_entry("first")
num2 = parse_entry("second")

say "choose one of the following \n 1) addition \n 2) subtraction  
    3) multiplication \n 4)division\n"

op = gets.chomp
result = nil

case op.to_i

  when 1
    result = num1.to_f + num2.to_f
  
  when 2
    result = num1.to_f - num2.to_f

  when 3
    result = num1.to_f * num2.to_f

  else
    if num2  == 0
      puts "divisor cannot be 0" 
    else 
      result = num1.to_f / num2.to_f
    end
end

if result.floor == result 
  puts result.to_i 
else 
  puts result
end