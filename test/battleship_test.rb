require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require 'pry'

class BattleshipTest < Minitest::Test

  def test_does_battleship_exist
  battleship = Battleship.new
  assert_instance_of Battleship, battleship
  end

  def test_loads_messages
  battleship = Battleship.new
  assert_equal "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", battleship.intro
  end
end