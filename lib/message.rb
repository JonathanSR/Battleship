module Message
    
    def self.welcome
      "\nWelcome to BATTLESHIP!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit? \n>"
    end 

    def self.place_ships
      "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the second is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\nPlease enter the first and last coordinates for both ships.\nAn example would be a1 a2 for the small ship. For the large\nship it would be a1 a3, which encompasses a1 a2 a3.\n>"
    end

    def self.display_coordinates
      "(A1 A2)"
    end

    def self.place_second_ship
      "Now enter coordinates for your three-unit ship.\n"
    end

    def self.second_ship_coordinates
      ("A1 A2 A3")
    end

    def self.fire
      "Enter your coordinates to fire upon:\n>"
    end

    def self.hit
      "You hit the enemy ship!\n"
    end

    def self.miss
      "Your shot missed the target.\n"
    end

    def self.coordinates_invalid
      "Enter new coordinates, the one entered have already been fired upon."
    end

    def self.end_turn
      "All rounds have been used, press ENTER to reload."
    end

    def self.ai_end_turn
      "Your foe is reloading, now is the time to attack.\n"
    end

    def self.ai_fired_on
      "Your rival has fired on coordinates #{attack}."
    end

    def self.ship_sunk_2
      "You hit and sunk the enemy's 2-unit ship!"
    end

    def self.ship_sunk_3
      "You hit and sunk the enemy's 3-unit ship!"
    end

    def self.congrats
      "Congrats, you truly are a master at sea.
       You defeated your rival in a time of {time} with {number of turns} turns used."
    end

    def self.you_lose
      "Better luck next time.
       You were destroyed in a time of {time} with {number of rounds} turns played."
    end

    def self.instructions
      "The object of Battleship is to try and sink all of the other player's ships before they sink all of your ships.\nAll of the other player's ships are somewhere on their board.\nYou try and hit them by calling out the coordinates of one of the squares on the board.\nThe other player also tries to hit your ships by calling out coordinates.\nNeither you nor the other player can see the other's board so you must try to guess where they are."
    end
    
    def self.error
      "Error!\nCan't execute command.\nPlease reload Battleship.rb"
    end

    def self.quit
      "Thanks for playing!"
    end

    def self.setup_complete
      "Get Set!
      Both fleets are ready for battle!"
    end
  end