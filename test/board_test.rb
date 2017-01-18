require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/coordinates'
require 'pry'

class BoardTest < Minitest::Test
  
  def test_does_board_class_exist
    board = Board.new
    assert_instance_of Board, board
  end

  def test_does_board_have_row_and_column_markers
    board = Board.new
    assert_equal ["1", "2", "3", "4"], board.rows
    assert_equal ["A", "B", "C", "D"], board.columns
  end

  def test_board_has_no_placements
    board = Board.new
    assert_equal [[" ", " ", " ", " "], 
                  [" ", " ", " ", " "],
                  [" ", " ", " ", " "],
                  [" ", " ", " ", " "]], board.game_board
  end

  def test_board_can_tell_if_space_is_free
    board = Board.new
    assert board.space_empty?([0,0])

    board.assign_square([0,0], "S")
    refute board.space_empty?([0,0])
  end

  def test__board_can_place_squares
    board = Board.new
    board.assign_square([0,0], "H")

    assert_equal "H", board.game_board[0][0]
    assert_equal [["H", " ", " ", " "],
                  [" ", " ", " ", " "],
                  [" ", " ", " ", " "],
                  [" ", " ", " ", " "]], board.game_board
  end

  def test_board_can_tell_hits_and_misses
    board = Board.new
    board.assign_square([0,0], "S")
    board.assign_square([1,0], "S")

    board.attack([0,0])
    board.attack([3,3])
    board.attack([1,0])

    assert_equal "H", board.game_board[0][0]
    assert_equal "M", board.game_board[3][3]
    assert_equal "H", board.game_board[1][0]
  end

  def test_board_can_tell_if_ship_is_hit
    board = Board.new
    board.assign_square([0,0], "S")
    board.assign_square([0,1], "S")

    assert board.hit?([0,0])
    refute board.hit?([1,0])
    assert board.hit?([0,1])
  end

  def test_coordinates_are_horizontal
    board = Board.new
    coordinates = [0,0], [0,1]
    coordinates1 = [0,0], [1,0]

    assert board.coordinates_are_horizontal?(coordinates)
    refute board.coordinates_are_horizontal?(coordinates1)
  end

  def test_coordinates_are_vertical
    board = Board.new
    coordinates = [0,0], [1,0]
    coordinates1 = [0,1], [3,2]

    assert board.coordinates_are_vertical?(coordinates)
    refute board.coordinates_are_vertical?(coordinates1)
  end

  def test_horizontal_coordinates_are_next_to
    board = Board.new
    coordinates = [1,1], [1,2]
    coordinates1 = [1,0], [2,3] 

    assert board.horizontal_coordinates_are_next_to_each_other?(coordinates)
    refute board.horizontal_coordinates_are_next_to_each_other?(coordinates1)
  end

  def test_veritical_coordinates_are_next_to
    board = Board.new
    coordinates = [1,0], [2,0]
    coordinates1 = [0,1], [3,1]

    assert board.vertical_coordinates_are_next_to_each_other?(coordinates)
    refute board.vertical_coordinates_are_next_to_each_other?(coordinates1)
  end

  def test_coordinates_are_val
    board = Board.new
    coordinates = [0,3], [1,3]
    coordinates1 = [0,0], [3,0]

    assert board.coordinates_are_valid?(coordinates)
    refute board.coordinates_are_valid?(coordinates1)
  end

  def test_find_center
    board = Board.new
    coordinates = [0,0], [0,2]
    coordinates1 = [1,0], [3,0]
    result = [0,1]
    result1 = [2,0]
    assert_equal result, board.find_center(coordinates)
    assert_equal result1, board.find_center(coordinates1)
  end

  def test_all_coordinates
    board = Board.new
    coordinates = [0,0], [0,2]
    result = [0,0], [0,1], [0,2]

    assert_equal result, board.all_coordinates(coordinates)
  end

  def test_returns_pair_from_user_input
    board = Board.new
    assert_equal [[0,0], [0,1]], board.coordinate_pair(" A1 A2")
    assert_equal [[1,1], [1,2]], board.coordinate_pair("b2 b3 ")
  end

  def test_translate_user_input
    c = Coordinates.new
    board = Board.new

    assert_equal [0,0], board.translate_input("A1")
    assert_equal [3,3], board.translate_input("D4")
    
  end
end