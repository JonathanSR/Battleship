require 'minitest/autorun'
require './test/test_helper'
require 'minitest/pride'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def test_that_player_class_exits
    p = Player.new(Board.new, Ship.new)
    assert_equal Player, p.class
  end

  def test_can_player_create_board
    p = Player.new(Board.new, Ship.new)
    assert_equal Board, p.board.class
  end

  def test_can_player_create_ship
    p= Player.new(Board.new, Ship.new)
    assert_equal Ship, p.ship.class
  end

  def test_player_can_set_ships
    p =Player.new(Board.new, Ship.new)
    p.set_ship([[0,0], [0,1]])
    p.set_ship([[1,1], [1,3]])
    assert_equal "S", p.board.game_board[0][0]
    assert_equal "S", p.board.game_board[0][1]
    assert_equal "S", p.board.game_board[1][1]
    assert_equal "S", p.board.game_board[1][2]
    assert_equal "S", p.board.game_board[1][3]
    assert_equal [["S", "S", " ", " "],
                  [" ", "S", "S", "S"],
                  [" ", " ", " ", " "],
                  [" ", " ", " ", " "]], p.board.game_board
  end

  def test_valid_random_coordinates_can_be_generated
    p = Player.new(Board.new, Ship.new)
    coordinates = p.ai_random_coordinates_large

    assert p.board.space_empty?(coordinates[0])
    assert p.board.space_empty?(coordinates[1])

  end

  def test_check_if_player_attack_is_valid
    p = Player.new(Board.new, Ship.new)
    p.board.assign_square([0,0], "H")
    p.board.assign_square([0, 1], "S")
    p.board.assign_square([0, 2], "M")

    refute p.valid_player_attack?([0,0], p.board)
    assert p.valid_player_attack?([0,1], p.board)
    refute p.valid_player_attack?([0,2], p.board)
  end

  def test_ai_can_generate_random_attack_coordinates
    p = Player.new(Board.new, Ship.new)
    coordinate = p.ai_attack_generator
    
    assert p.board.space_empty?(coordinate.flatten)
  end

end