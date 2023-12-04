require "./trebuchet.cr"
require "./cube_conundrum.cr"
require "./gear_ratios.cr"
require "./scratchcards.cr"

treb = Trebuchet.new

puts "Day 1"
puts treb.part_1
puts treb.part_2

cube = CubeConundrum.new

puts "Day 2"
puts cube.part_1
puts cube.part_2

gear = GearRatios.new

puts "Day 3"
puts gear.part_1
puts gear.part_2

cards = Scratchcards.new

puts "Day 4"
puts cards.part_1
puts cards.part_2