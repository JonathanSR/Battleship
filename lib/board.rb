class Board
require 'pry'

attr_reader :row_markers, :column_markers

  def initialize
  @row_markers = ["1", "2", "3", "4"]
  @column_markers = ["A", "B", "C", "D"]
  end


  def board_visual
  board_layout = Array.new(4, "*").map{|row| Array.new(4, "*")}
 
  print "======================================"
  print "\n"
  print "\t"
  print row_markers.join("\t")
  puts
  board_layout.each_with_index do |row, i|
  print column_markers[i]
  print "\t"
  print row.join("\t")
  puts
  end
  puts "======================================"
  end
end



#  b = Board.new
# b.board_visual