def is_repeat_pattern(number)
  str = number.to_s
  length = str.length

  (1..length/2).each do |pattern_len|
    next unless length % pattern_len == 0
    pattern = str[0, pattern_len]
    repetitions = length / pattern_len
    if pattern * repetitions == str
      return true
    end
  end

  false
end

count = 0

File.foreach("#{__dir__}/input.txt", chomp: true) do |line|
  line.split(",").each do |range|
    values = range.split("-")
    (values[0].to_i..values[1].to_i).each do |number|
      if is_repeat_pattern(number)
        count += number
      end
    end
  end
end

puts "=" * 50
puts "Advent of Code - Puzzle 2"
puts "Count: #{count}"