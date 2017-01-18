require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require 'pry'

class BattleshipTest < Minitest::Test

  def test_does_battleship_exist
    battleship = Battleship.new
    assert_instance_of Battleship, battleship
  end

  def test_can_battleship_access_player_class
    p = Player.new(Board.new, Ship.new)
    assert_equal Player, p.class
  end

  def test_messages_can_be_accessed
    battleship = Battleship.new
    assert_equal "Thanks for playing!", Message.quit
  end


###Need tests for the following methods:

  # def test_can_ai_place_ships
  # battleship = Battleship.new
  # assert_equal 0, battleship.ai_ship_placement
  # end

  #  def test_can_ai_place_ships_large
  # battleship = Battleship.new
  # assert_equal 0, battleship.ai_ship_placement_large
  # end


#   def test_player_1_can_place_ships
#   battleship = Battleship.new
#   assert_equal 0, battleship.player_1_ship_placement
#   end

  # def test_can_player_sequence_be_initiated
  #   battleship = Battleship.new
  #   assert_equal 0, battleship.player_gameplay
  #   binding.pry
  # end

  # def test_ai_turn_sequence_can_be_initiated
  #   battleship = Battleship.new
  #   assert_equal 0, battleship.ai_attack_sequence
  # end
end