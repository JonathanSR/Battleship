require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require 'pry'

class ShipsTest < Minitest::Test

  def test_does_ships_class_exist
  ships = Ships.new
  assert_instance_of Ships, ships
  end

  def test_does_it_have_a_ship
  ships = Ships.new(2)
  assert_equal 2, ships.size
  end

  def test_can_ship_be_bigger_than_two_units
  ships = Ships.new(3)
  assert_equal 3, ships.size
  end

  def test_can_ship_receive_coordinates
  ships = Ships.new
  coords = Coordinates.new
  end
end