require './lib/message'
require './lib/player'
require './lib/board'
require 'pry'

class Battleship
include Message
attr_reader :input, :player1, :ai

  def initialize
    @player1 = Player.new(Board.new, Ship.new)
    @ai = Player.new(Board.new, Ship.new)
  end

  def game_mode
    intro
    gameplay
  end

  def intro
    print Message.welcome
    menu_screen
  end

  def setup
    ai_ship_placement
    ai_ship_placement_large
    print Message.place_ships
    player_1_ship_placement
    player_1_ship_placement
    puts Message.setup_complete
  end

  def gameplay
    while true
    player_gameplay
    ai_gameplay
    end
  end
  
  def menu_screen
    input = gets.strip.downcase
      if input == 'i' || input == "instructions"
        print Message.instructions
        intro
      elsif input == 'p' || input == "play"
        setup
      elsif input == 'q' || input == "quit"
        puts Message.quit
        abort
      else 
        print Message.error
      end
  end

  def ai_ship_placement
    coordinates = ai.ai_random_coordinates(ai.ship)
    ai.board.coordinates_are_valid?(coordinates)
    ship = ai.set_ship(coordinates)
    ai.ships << ship
  end

  def ai_ship_placement_large
    coordinates = ai.ai_random_coordinates_large
    ai.board.coordinates_are_valid?(coordinates)
    ship = ai.set_ship(coordinates)
    ai.ships << ship
  end

  def player_1_ship_placement
    player_input = gets.strip
    coordinates = player1.board.coordinate_pair(player_input)
    placement_valid = player1.board.coordinates_are_valid?(coordinates)
    ship = player1.set_ship(coordinates)
    player1.ships << ship
  end

  def player_gameplay
    player_boards
    print Message.fire
    attack_sequence 
    check_status
  end

  def attack_sequence
    attack_input = gets.strip
    attack_coordinates = ai.board.translate_input(attack_input)
    ai.valid_player_attack?(attack_coordinates, ai.board)
      if ai.board.hit?(attack_coordinates)
        print Message.hit
      else 
        print Message.miss
      end
      ai.board.attack(attack_coordinates)
  end

  def check_status
    if !ai.board.game_board.flatten.include?("S")
      abort print Message.congrats
    else
      player_boards
      print Message.end_turn
      gets
    end
  end
    

  def ai_gameplay
    player_boards
    ai_attack_sequence
    check_ai_status
  end

  def ai_attack_sequence
    attack_coordinates = player1.ai_attack_generator
    attack = attack_coordinates.flatten
    player1.valid_player_attack?(attack, player1.board)
    player1.board.attack(attack)
    print "AI fired on coordinates #{attack}.\n"
  end

  def check_ai_status
    if !player1.board.game_board.flatten.include?("S")
      abort print Message.you_lose
    else
      player_boards
      print Message.ai_end_turn
      gets
    end
  end

  def player_1_board
    puts "Player 1\n"
    puts "#{player1.board.display_board}\n"
  end

  def ai_board
    puts "Artificial Intelligence\n"  
    puts "#{ai.board.display_board}\n"
  end

  def player_boards
    player_1_board
    ai_board
  end
end

#  b = Battleship.new
# # #p b.setup
#  b.game_mode