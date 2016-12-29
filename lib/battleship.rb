require './lib/message'
#require './lib/board'
require 'pry'

class Battleship
attr_reader :input

  def intro
    p Message.welcome
    #input
    game_mode
  end

  def input
    user_input = gets.to_s.downcase.chomp
  end
  
  def game_mode
    if input == 'i' 
    Message.instructions
    elsif input == 'p'
    Message.place_ships
    elsif input == 'q'
    Message.quit
    else
    Message.error
    end
  end
end

b = Battleship.new
p b.intro
#p b.game_mode