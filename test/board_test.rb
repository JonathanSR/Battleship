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
  assert_equal ["1", "2", "3", "4"], board.row_markers
  assert_equal ["A", "B", "C", "D"], board.column_markers
  end

  def test_board_has_blank_array
  board = Board.new
  assert_equal ["*", "*", "*", "*"], Array.new(4, "*")
  end

end
