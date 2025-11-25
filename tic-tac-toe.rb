def create_box
    #stuff
end

class Box
    def initialize(variable) #Variable can be either O, X, or "Empty"
        @variable = variable
    end

    def check_box #Allows user to check what is in the box
        puts(@variable)
    end

    def self.create_box()
        Box.new()
    end
end

class Player
    def initialize(player_type) #player_type can be either Player1, Player2, or Computer
        @player_type = player_type
    end
end