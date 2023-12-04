class GearRatios
  @plot : Array(Array(String))
  @store : Store
  @valid : Array(Tuple(String, Array(Int32)))

  def initialize(file = "input/gear_ratios.txt")
    @plot = File
      .read(file)
      .strip
      .split("\n")
      .map { |row| row.split("") }

    @store = Store.new

    map_points_in_plot
    
    @valid = @store.valid_numbers
  end

  def part_1
    @valid.reduce(0) do |acc, numbers|
      acc + numbers[1].sum
    end
  end

  def part_2
    @valid.reduce(0) do |acc, number|
      if number[0] == "*" && number[1].size == 2
        acc + number[1].product(1)
      else
        acc
      end
    end
  end

  private def map_points_in_plot
    digits = Digit.new

    @plot.each_with_index do |row, y|
      row.each_with_index do |column, x|
        current_point = @plot[y][x]

        if current_point.char_at(0).ascii_number?
          digits.add(y, x, current_point)
          next
        end

        if digits.size > 0
          @store.add_digit(digits)
        end

        if current_point != "."
          @store.add_symbol(SymbolPoint.new(x, y, @plot[y][x]))
        end

        digits = Digit.new
      end
    end
  end
end

class Store
  @symbols : Array(SymbolPoint)
  @digits : Array(Digit)

  def initialize
    @symbols = [] of SymbolPoint
    @digits = [] of Digit
  end

  def add_digit(digits)
    @digits.push(digits)
  end

  def add_symbol(symbol)
    @symbols.push(symbol)
  end

  def valid_numbers
    @symbols.map do |symbol|
      numbers = @digits
        .select { |digit| symbol.neighbors.intersects? digit.points }
        .map { |digit| digit.integer }
      
      {symbol.value, numbers}
    end
  end
end

class Digit
  @points : Set(String)
  @values : Array(String)

  def initialize
    @points = Set(String).new
    @values = [] of String
  end

  def add(y, x, value)
    @values.push(value)
    @points.add("#{y}_#{x}")
  end

  def integer
    @values.join("").to_i
  end

  def points
    @points
  end

  def size
    @values.size
  end
end

class SymbolPoint
  @value : String
  @neighbors : Set(String)

  def initialize(y, x, value)
    @value = value
    @neighbors = add_neighbors(y, x)
  end

  def value
    @value
  end

  def neighbors
    @neighbors
  end

  private def add_neighbors(x, y)
    Set{
      "#{y}_#{x - 1}",
      "#{y}_#{x + 1}",
      "#{y - 1}_#{x}",
      "#{y - 1}_#{x - 1}",
      "#{y - 1}_#{x + 1}",
      "#{y + 1}_#{x}",
      "#{y + 1}_#{x - 1}",
      "#{y + 1}_#{x + 1}",
    }
  end
end
