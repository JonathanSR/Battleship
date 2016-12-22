class Messages
    
    def welcome
    puts "Welcome to BATTLESHIP!\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit? >"
    end

    def place_ships
    puts "I have laid out my ships on the grid.\n\nYou now need to layout your two ships.\n\nThe first is two units long and the\n\nsecond is three units long.\n\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
    end

    def display_coordinates
    "(A1 A2)"
    end

    def place_second_ship
    puts "Now place your three-unit ship."
    end

    def second_ship_coordinates
    ("A1 A2 A3")
    end

    def fire
    puts "Enter your coordinates to fire upon."
    end

    def hit
    puts "You hit the enemy ship!"
    end

    def miss
    puts "Your shot missed the target."
    end

    def coordinates_used_already
    puts "Enter new coordinates, the one entered has already been fired upon."
    end

    def end_turn
    puts "All rounds have been used, press ENTER to reload"
    end

    def computer_fired_upon
    puts "Your rival has fired upon {enter coordinates} and {hit/miss}"
    end

    def ship_sunk_2
    puts "You hit and sunk the enemy's 2-unit ship!"
    end

    def ship_sunk_3
    puts "You hit and sunk the enemy's 3-unit ship!"
    end

    def congrats
    puts "Congrats, you truly are a master at sea, you defeated your rival in a time of {time} with {number of turns} turns used.".chomp
    end

    def better_luck_next_time
    puts "Better luck in the afterlife, you were destroyed in a time of {time} with {number of rounds} turns played."
    end

    def instructions
    puts "The objective of Battleship is to beat the AI at destroying its two ships before it destroys yours.\n\nYou are assigned a two-unit and a three-unit ship that you will select coordinates to place on the board.\n\nOnce the AI places its ships the game begins.\n\n You will take turns firing until there is a winner."
    end
    
    def error
    puts "Error! Missfire!\n\nCan't execute command\n\nPlease reload Battleship.rb"
    end

    def quit
    puts "Thanks for playing!"
    end
  end