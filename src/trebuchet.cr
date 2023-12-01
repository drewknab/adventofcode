class Trebuchet
    @content : String

    def initialize(file = "input/trebuchet.txt")
      @goofy_number_strings = [
        {"oneight", 18},
        {"twone", 21},
        {"threeight", 38},
        {"sevenine", 79},
        {"fiveight", 58},
        {"eightwo", 82},
        {"eighthree", 83},
        {"nineight", 98}
      ]
      @number_strings = [
        "zero",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine"
      ]
      @content = File.read(file).rstrip()
    end

    def part_1
      content = @content.split("\n")

      find_the_sum(content)
    end

    def part_2
      temp_content = @content

      @goofy_number_strings.each do |tuple|
        temp_content = convert_number_names_to_integers(*tuple, temp_content)
      end

      @number_strings.each_with_index do |word, integer|
        temp_content = convert_number_names_to_integers(word, integer, temp_content)
      end

      find_the_sum(temp_content.split("\n"))
    end

    def convert_number_names_to_integers(word, integer, content)
      content.gsub(word) {"#{integer}"}
    end

    def find_the_sum(content)
      content.reduce(0) do |acc, i|
        acc += find_value(i)
      end
    end

    def find_value(i)
      digits = scan_for_digits(i)
      size = digits.size
      case
      when size == 0
        0
      when size == 1 
        "#{digits.first()}#{digits.first()}".to_i
      when size > 2
        "#{digits.first()}#{digits.last()}".to_i
      else
        digits.join("").to_i
      end
    end

    def scan_for_digits(value)
      value.scan(/\d/).flat_map(&.to_a)#.reject{ |value| value.size < 2 }
    end
end