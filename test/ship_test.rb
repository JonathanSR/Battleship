require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def test_does_ship_class_exist
    ship = Ship.new
    assert_instance_of Ship, ship
  end

  def test_does_it_have_a_ship
    ship = Ship.new(2)
    assert_equal 2, ship.size
  end

  def test_can_ship_be_bigger_than_two_units
    ship = Ship.new(3)
    assert_equal 3, ship.size
  end

  def test_ship_starts_with_no_hits
    ship = Ship.new
    hits = 0
    assert_equal 0, ship.hits
  end

  def test_ship_can_be_hit
    ship = Ship.new
    assert_equal 1, ship.hit
  end

  def test_when_ship_looses_health
    ship = Ship.new
    ship.hit
    assert_equal 1, ship.health
  end

  def test_ship_sunk_when_out_of_health
    ship = Ship.new(3)
    ship.hit
    refute ship.sunk?
    ship.hit
    ship.hit
    assert ship.sunk?
  end
end