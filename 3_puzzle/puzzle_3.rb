def find_12_digit_number(line)
  return nil if line.length < 12
  
  result = []
  start_index = 0
  
  (1..12).each do |position|
    remaining_needed = 12 - position
    
    search_end = line.length - remaining_needed - 1
    
    if start_index > search_end || start_index >= line.length
      # take what's remaining if not enough digits left
      result += line[start_index..-1].chars.map(&:to_i) if start_index < line.length
      break
    end
    
    searchable = line[start_index..search_end]
    max_digit = searchable.chars.map(&:to_i).max
    
    max_digit_str = max_digit.to_s
    relative_index = searchable.index(max_digit_str)
    absolute_index = start_index + relative_index
    
    result << max_digit
    start_index = absolute_index + 1
  end
  
  result.join
end

count = 0
File.foreach("#{__dir__}/input.txt", chomp: true) do |line|
  next if line.empty?
  max_number = find_12_digit_number(line)
  count += max_number.to_i
end

puts "=" * 50
puts "Advent of Code - Puzzle 3"
puts "Count: #{count}"











# Part 1
# count = 0
# File.foreach("#{__dir__}/input.txt", chomp: true) do |line|
#   next if line.empty?
#   Find max digit (excluding last)
#   tens_digit = line[0..-2].chars.map(&:to_i).max
#   tens_index = line[0..-2].index(tens_digit.to_s)
#   puts "tens_digit: #{tens_digit}"
#   puts "tens_index: #{tens_index}"

#   Find max digit after tens_digit, excluding tens_digit itself
#   remaining = line[(tens_index + 1)..]
#   ones_digit = remaining.chars.map(&:to_i).reject { |d, i| i == line[tens_index] }.max

#   max_number = tens_digit * 10 + ones_digit
# end

# puts "=" * 50
# puts "Advent of Code - Puzzle 2 part 1"
# puts "Count: #{count}"