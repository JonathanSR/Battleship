class Message
    
    def welcome
      "Welcome to BATTLESHIP! Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
    end

    def place_ships
      "I have laid out my ships on the grid. 
      You now need to layout your two ships.
      The first is two units long and the 
      second is three units long.
      The grid has A1 at the top left and D4 at the bottom right.
      Enter the coordinates for the two-unit ship:"
    end

    def display_coordinates
    "(A1 A2)"
    end

    def place_second_ship
      "Now enter coordinates for your three-unit ship."
    end

    def second_ship_coordinates
    ("A1 A2 A3")
    end

    def fire
      "Enter your coordinates to fire upon."
    end

    def hit
      "You hit the enemy ship!"
    end

    def miss
      "Your shot missed the target."
    end

    def coordinates_used_already
      "Enter new coordinates, the one entered have already been fired upon."
    end

    def end_turn
      "All rounds have been used, press ENTER to reload."
    end

    def computer_fired_upon
      "Your rival has fired upon {enter coordinates} and {hit/miss}."
    end

    def ship_sunk_2
      "You hit and sunk the enemy's 2-unit ship!"
    end

    def ship_sunk_3
      "You hit and sunk the enemy's 3-unit ship!"
    end

    def congrats
      "Congrats, you truly are a master at sea.
       You defeated your rival in a time of {time} with {number of turns} turns used."
    end

    def better_luck_next_time
      "Better luck next time.
       You were destroyed in a time of {time} with {number of rounds} turns played."
    end

    def instructions
      "The objective of Battleship is to beat the AI at destroying its two ships before it destroys yours.\n\nYou are assigned a two-unit and a three-unit ship that you will select coordinates to place on the board.\n\nOnce the AI places its ships the game begins.\n\n You will take turns firing until there is a winner."
    end
    
    def error
      "Error! 
      Can't execute command.
      Please reload Battleship.rb"
    end

    def quit
      "Thanks for playing!"
     #exit(0) #or break ### to quit the game
    end
  end