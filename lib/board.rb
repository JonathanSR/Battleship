require './lib/coordinates'
require 'pry'

class Board
  
  attr_reader :rows, :columns, :game_board 
  def initialize
    @rows = ["1", "2", "3", "4"]
    @columns = ["A", "B", "C", "D"]
    @game_board = Array.new(4, " ").map{|row| Array.new(4, " ")}
  end 


  def display_board
   print "========================================="
   print "\n"
   print "\t"
   print rows.join("\t")
   puts
   @game_board.each_with_index do |row, i|
   print @columns[i]
   print "\t"
   print row.join("\t")
   puts
   end
   puts "==========================================="
  end

  def space_empty?(coordinates)
    row, column = coordinates
    game_board[row][column] == " "
  end

  def assign_square(coordinates, status)
    row, column = coordinates
    game_board[row][column] = status
  end

  def attack(coordinates)
    row, column = coordinates
    if game_board[row][column] == "S"
    assign_square(coordinates, "H")
    else
    assign_square(coordinates, "M")
    end
  end

  def hit?(coordinates)
    row, column = coordinates
    game_board[row][column] == "S"
  end

   def coordinates_are_horizontal?(coordinates)
    first, last = coordinates
    first[0] == last[0]
  end

  def coordinates_are_vertical?(coordinates)
    first, last = coordinates
    first[1] == last[1]
  end

  def horizontal_coordinates_are_next_to_each_other?(coordinates)
    first, last = coordinates
    (first[1] - last[1]).abs == 1 &&
    coordinates_are_horizontal?(coordinates)
  end

  def vertical_coordinates_are_next_to_each_other?(coordinates)
    first, last = coordinates
    (first[0] - last[0]).abs == 1 &&
    coordinates_are_vertical?(coordinates)
  end

  def coordinates_are_valid?(coordinates)
    first, last = coordinates
    vertical_coordinates_are_next_to_each_other?(coordinates) ||
    horizontal_coordinates_are_next_to_each_other?(coordinates)
  end


  def find_center(coordinates)
    first, last = coordinates
      if coordinates_are_horizontal?(coordinates)
      medium = [first[0]]
      medium << last[1] - 1
      else 
      medium = [last[0] - 1]
      medium << first[1]
      end 
  end

  def all_coordinates(coordinates)
    first, last = coordinates
    all = [first, find_center(coordinates), last]
  end

  def coordinate_pair(user_input)
    pair = user_input.split(" ").map {|coord| coord.strip}
    final_pair = pair.map do |coord|
    translate_input(coord)
    end
  end

    def translate_input(user_input)
      c = Coordinates.new
      c.coordinate
      user_data = user_input.upcase.strip
      coordinates_translated = c.coordinate[user_data]
    end
  end
