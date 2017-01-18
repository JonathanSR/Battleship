require './lib/board'
require './lib/ship'

class Player

  attr_reader :board, :ship, :ships
  def initialize(board, ship)
    @board = board
    @ship = ship
    @ships = []
  end

  def set_ship(coordinates)
    coords = board.all_coordinates(coordinates)
    coords.each do |coordinate|
    board.assign_square(coordinate, "S")
    end
  end

  def ai_random_coordinates(ship)
    row  = rand(4)
    column = rand(4 - (ship.size - 1))
    coordinates = [[row,column], [row, (column + ship.size - 1)]]
      if rand(2) == 1
      coordinates = coordinates.map {|coord| coord.reverse}
      end
    coordinates
  end

  def ai_random_coordinates_large
    row  = rand(4)
    column = rand(2)
    coordinates = [[row,column], [row, (column + 2)]]
      if rand(2) == 1
      coordinates = coordinates.map {|coord| coord.reverse}
      end
    coordinates
  end

  def valid_player_attack?(location, board)
    row, column = location
    !["H", "M"].include?(board.game_board[row][column])
  end
  
  def ai_attack_generator
    [[rand(4)],[rand(4)]]
  end
end