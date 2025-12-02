def count_ticks(start, distance, direction)
  if start == 0
    return distance / 100
  end
  
  if direction == "L"
    if start - distance <= 0
      remaining_after_one_clicks = distance - start
      return 1 + (remaining_after_one_clicks / 100)
    end
  end

  if direction == "R"
    if start + distance >= 100
      remaining_after_one_clicks = distance - (100 - start)
      return 1 + (remaining_after_one_clicks / 100)
    end
  end

  return 0
end

def get_position(start, distance, direction)
  if (direction == "L")
    (start - distance) % 100
  elsif (direction == "R")
    (start + distance) % 100
  else
    start
  end
end


# Main function
start = 50
ticks = 0

File.foreach("#{__dir__}/input.txt", chomp: true) do |line|
  direction = line[0]
  distance = line[1..-1].to_i
  ticks += count_ticks(start, distance, direction)
  start = get_position(start, distance, direction)
end

puts "Password: #{ticks}"