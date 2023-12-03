class CubeConundrum
  @games : Array(Game)

  def initialize(file = "input/cube_conundrum.txt")
    @games = File
      .read(file)
      .rstrip()
      .gsub("Game ") {""}
      .split("\n")
      .map { |game| Game.new game }
  end

  def part_1
    @games.reduce(0) do |acc, game|
      if game.is_valid?
        acc + game.id
      else
        acc + 0
      end
    end
  end

  def part_2
    @games.reduce(0) do |acc, game|
      acc + game.minimums.product(1)
    end
  end
end

class Game
  @id : Int32
  @cubes : Array(Cube)
  @minimums : Array(Int32)

  def initialize(game)
    temp_game = game.split(": ")
    @id = temp_game[0].to_i32
    @cubes = temp_game[1]
      .gsub(";", ",")
      .split(", ")
      .map { |cubes| Cube.new cubes }

    @minimums = @cubes
      .group_by { |cube| cube.color }
      .map { |color| color[1].max_of { |cube| cube.count } }
  end

  def id
    @id
  end

  def minimums
    @minimums
  end

  def is_valid?
    @cubes.all? { |cube| cube.is_valid? }
  end
end

class Cube
  @count : Int32
  @color : String
  @valid : Bool

  def initialize(cubes : String)
    cube = cubes.lstrip().rstrip().split(" ")
    
    @count = cube[0].to_i()
    @color = cube[1].to_s

    @valid = color_validity()
  end

  def is_valid?
    @valid
  end

  def color
    @color
  end

  def count
    @count
  end

  private def color_validity
    case @color
    when "red" then @count <= 12
    when "green" then @count <= 13
    else @count <= 14
    end
  end
end

