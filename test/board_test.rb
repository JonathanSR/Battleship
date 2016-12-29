require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  
  def test_does_board_exist
    board = Board.new
    assert_instance_of Board, board
  end

  def test_does_board_have_row_and_column_markers
    board = Board.new
    assert_equal ["1", "2", "3", "4"], board.row_marker
    assert_equal ["A", "B", "C", "D"], board.column_marker
  end

  def test_board_has_no_placements
    board = Board.new
    assert_equal ["-", "-", "-", "-"], Array.new(4, "-")
  end

  def test_board_can_tell_if_space_is_free
    board = Board.new
    refute board.space_empty?(0, 0)
  end

  def test_coordinates_given_are_horizontal
    board = Board.new
    first_coordinate = [0,0]
    second_coordinate = [0,1]
   assert board.coordinates_are_horizontal?(first_coordinate, second_coordinate)
  end

  def test_coordinates_given_are_not_horizontal
    board = Board.new
    first_coordinate = [0,0]
    second_coordinate = [1,2]
    refute board.coordinates_are_horizontal?(first_coordinate, second_coordinate)
  end


  def test_coordinates_given_are_vertical
    board = Board.new
    first_coordinate = [0,0]
    second_coordinate = [1,0]
    assert board.coordinates_are_vertical?(first_coordinate, second_coordinate)
  end

  def test_coordinate_given_are_not_vertical
    board = Board.new
    first_coordinate = [0,0]
    second_coordinate = [2,2]
    refute board.coordinates_are_vertical?(first_coordinate, second_coordinate)  
  end

  def test_if_horizontal_coordinates_are_next_to
    board = Board.new
    coordinates = Coordinates.new
    first_coordinate = [0,0]
    second_coordinate = [0,1]
    assert board.horizontal_coordinates_are_next_to?(first_coordinate, second_coordinate)
    end

    def test_if_horizontal_coordinates_are_not_next_to
      board = Board.new
      coordinates = Coordinates.new
      first_coordinate = [1,3]
      second_coordinate = [2,2]
      refute board.horizontal_coordinates_are_next_to?(first_coordinate, second_coordinate)
    end

    def test_are_vertical_coordinates_next_to
      board = Board.new
      coordinates = Coordinates.new
      first_coordinate = [1,0]
      second_coordinate = [2,0]
      assert board.vertical_coordinates_are_next_to?(first_coordinate, second_coordinate)
    end

    def test_if_vertical_coordinates_are_not_next_to
      board = Board.new
      coordinates = Coordinates.new
      first_coordinate = [0,0]
      second_coordinate = [2,1]
      refute board.vertical_coordinates_are_next_to?(first_coordinate, second_coordinate)
    end

  def test_coordinates_are_valid
    board = Board.new
    coordinates = Coordinates.new
    first_coordinate = [0,0]
    second_coordinate = [0,1]
    assert board.coordinates_are_valid?(first_coordinate, second_coordinate)
  end

  def test_coordinates_are_not_valid
    board = Board.new
    coordinates = Coordinates.new
    first_coordinate = [0,0]
    second_coordinate = [2,2]
    refute board.coordinates_are_valid?(first_coordinate, second_coordinate)
  end

  def test_can_board_place_ships
    board = Board.new
    coordinates = Coordinates.new
    first_coordinate = [0,0]
    second_coordinate = [0,1]
    first_piece = first_coordinate
    second_piece = second_coordinate
    assert_equal "*", board.game_pieces_board(first_piece = "*")
    assert_equal "*", board.game_pieces_board(second_piece = "*")
  end
end
