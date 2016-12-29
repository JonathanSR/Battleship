require 'minitest/autorun'
require 'minitest/pride'
require './lib/coordinates'
require 'pry'

class CoordinatesTest < Minitest::Test

  def test_do_coordinates_exist
  coords = Coordinates.new
  assert_instance_of Coordinates, coords
  end

  def test_does_it_have_columns
  coords = Coordinates.new
  assert_equal ["A", "B", "C", "D"], coords.columns
  end

  def test_does_it_have_rows
  coords = Coordinates.new
  assert_equal [1, 2, 3, 4,], coords.rows
  end

  def test_does_it_have_coordinates
  coords = Coordinates.new
  assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], coords.coordinates_generated
  end

  def test_does_it_have_coordinates_with_kv
  coords = Coordinates.new
  assert_equal [0,0], coords.coordinate["A1"]
  end
end
  
  