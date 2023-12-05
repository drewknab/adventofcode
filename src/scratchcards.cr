class Scratchcards
  @cards : Array(Card)

  def initialize(file = "input/scratchcards.txt")
    games = File
      .read(file)
      .strip
      .gsub("Card ", "")
      .split("\n")
    
    @cards = games.map do |game|
      Card.new game
    end

    @cards.each_with_index do |card, index|
      if card.winner
        ((index + 1)..(index + card.winning_numbers_held.size)).each do |number|
          @cards[number].add_count(card.count)
        end
      end
    end
  end

  def part_1
    @cards.reduce(0) do |acc, card|
      winners_held = card.not_nil!.winning_numbers_held

      add = 0
      unless winners_held.empty? 
        size = winners_held.size

        add = size > 1 ? 2 ** (size - 1) : 1
      end

      acc + add
    end
  end

  def part_2
    @cards.reduce(0) { |acc, card| acc += card.count }
  end
end

class Card
  @id : Int32
  @winning_numbers : Set(Int32)
  @held_numbers : Set(Int32)
  @winning_numbers_held : Set(Int32)
  @winner : Bool
  @count : Int32

  def initialize(card)
    partial = card.split(": ")
    @id = partial[0].to_i

    card_numbers = partial[1].split(" | ")
    @winning_numbers = transform_card_numbers(card_numbers[0]).to_set
    @held_numbers = transform_card_numbers(card_numbers[1]).to_set
    @winning_numbers_held = @held_numbers & @winning_numbers
    @winner = !@winning_numbers_held.empty?
    @count = 1
  end

  def id
    @id
  end

  def winner
    @winner
  end

  def winning_numbers_held
    @winning_numbers_held
  end

  def count
    @count
  end

  def add_count(added_value)
    @count += added_value
  end

  private def transform_card_numbers(card_numbers)
    card_numbers
      .split(" ")
      .reject{ |number| number == "" }
      .map { |number| number.to_i } 
  end
end
