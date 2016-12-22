require './lib/messages'
#require './lib/board'
require 'pry'

class Battleship
attr_reader :input

  def initialize
  @messages = Messages.new
 #  @board = Board.new
  @input = input
  end

  def intro
  @messages.welcome
  input
  game_mode
  end

  def input
  user_input = gets.to_s.downcase.chomp
  end
  
  def game_mode
  if input == 'i' 
  @messages.instructions
  elsif input == 'p'
  @messages.place_ships
  elsif input == 'q'
  @messages.quit
  else
  @messages.error
  end
  end
end

# b = Battleship.new
# p b.intro
# p b.game_mode