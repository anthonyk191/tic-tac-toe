class Box
    attr_reader :variable, :box_name
    @@box_count = 0
    def initialize(variable = "Empty") #Variable can be either O, X, or "Empty"
        @variable = variable
        @@box_count += 1
        @box_name = @@box_count
    end
    
    def updateVariable(variable)
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
    attr_reader :player_name, :symbol, :score
    def initialize(player_name, symbol, score = 0) #player_type can be either Player1, Player2, or Computer
        @player_name = player_name
        @symbol = symbol
        @score = score
    end
    
    def play(box_number) #box_number is an integer between 1 to 9 which represent the tic-tac-toe boxes
        box_number.updateVariable(@symbol)
        puts("#{@player_name} has put an #{@symbol} into #{box_number.box_name}")
    end
    
    def add_point()
        @score += 1
    end
    
    def reset_score()
        @score = 0
    end
end

class GameManager
    def initialize(player1 = Player.new("Player1", "X"), player2 = Player.new("Player2", "O"))
        @player1 = player1
        @player2 = player2
    end
    
    def add_point(player) #Adds point to player object
        player.add_point()
    end
    
    def reset_scores() #Resets the internal scores for both player 1 and 2
        @player1.reset_score()
        @player2.reset_score()
    end
end    



def create_box()
    return(Box.new())
end

#Creating a game box
game_box = []
for i in 0...3
    game_box.push([])
    for j in 0...3
        game_box[i].push(create_box)
    end
end

output = game_box[2][2] #For texting purposes

player_1 = Player.new("Player1", "X")
player_2 = Player.new("Player2", "O")

player_1.play(output)
output.check_box
