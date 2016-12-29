require './lib/coordinates'
require './lib/message'
require 'pry'

class Board
  attr_reader :game_pieces_board, :game_board, :first_piece, second_piece
  
  def initialize
  @coordinates = Coordinates.new
  @game_pieces_board =  Array.new(4, "-").map{|row| Array.new(4, "-")}
  @game_board = Array.new(4, "-").map{|row| Array.new(4, "-")}
  @first_piece = first_piece
  @second_piece = second_piece
  end

  def row_marker
    ["1", "2", "3", "4"]
  end

  def column_marker 
    ["A", "B", "C", "D"]
  end

  def board_visual
    @game_pieces_board = Array.new(4, "-").map{|row| Array.new(4, "-")}
    binding.pry
    print "======================================"
    print "\n"
    print "\t"
    print row_marker.join("\t")
    puts
    game_pieces_board.each_with_index do |row, i|
    print column_marker[i]
    print "\t"
    print row.join("\t")
    puts
    end
    puts "======================================"
  end

  def user_coords
    player_pieces = gets.to_s.upcase.chomp
    new_coords = player_pieces.split(" ")
    @x = new_coords[0]
    @y = new_coords[1]
  end

  def input_to_coordinates(x, y)
  # x = @new_coords[0]
  # y = @new_coords[1]
  first_coordinate = @coordinates.coordinate[x]
  second_coordinate = @coordinates.coordinate[y]
  end


  def space_empty?(x, y)
    if game_pieces_board[x][y] == "-"
    false
    else 
    true  
    end
  end


  def coordinates_are_horizontal?(first_coordinate, second_coordinate)
    if first_coordinate[0] == second_coordinate[0]
    true
    else
    false
    end
  end

  def coordinates_are_vertical?(first_coordinate, second_coordinate)
    if first_coordinate[1] == second_coordinate[1]
    true
    else
    false
    end
  end

  def horizontal_coordinates_are_next_to?(first_coordinate, second_coordinate)
    if ((first_coordinate[1] - second_coordinate[1]).abs == 1) && coordinates_are_horizontal?(first_coordinate, second_coordinate)
    true
    else
    false
    end
  end

  def vertical_coordinates_are_next_to?(first_coordinate, second_coordinate)
    if ((first_coordinate[0] - second_coordinate[0]).abs == 1) && coordinates_are_vertical?(first_coordinate, second_coordinate)
    true
    else
    false
    end
  end

  def coordinates_are_valid?(first_coordinate, second_coordinate)
    if vertical_coordinates_are_next_to?(first_coordinate, second_coordinate) || horizontal_coordinates_are_next_to?(first_coordinate, second_coordinate)
    true
    else
    false
    end
  end

  def place_two_unit_ship
    @first_piece
    @second_piece
    if coordinates_are_valid?(first_coordinate, second_coordinate) && space_empty == true
    game_pieces_board(first_piece = "*")
    game_pieces_board(second_piece = "*")
    end
  end
end



#  b = Board.new
#  p b.user_coords