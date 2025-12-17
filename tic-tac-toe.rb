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
end

class Player
    attr_reader :name, :symbol, :score
    def initialize(name, symbol, score = 0) #player_type can be either Player1, Player2, or Computer
        @name = name
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
    @@game_box
    def initialize(player1 = Player.new("Player1", "X"), player2 = Player.new("Player2", "O"))
        @player1 = player1
        @player2 = player2
        reset_board()
    end
    
    def add_point(player) #Adds point to player object
        player.add_point()
    end
    
    def reset_scores() #Resets the internal scores for both player 1 and 2
        @player1.reset_score()
        @player2.reset_score()
    end

    def reset_board()
        @@game_box = []
        for i in 0...3
            @@game_box.push([])
            for j in 0...3
                @@game_box[i].push(Box.new())
            end
        end
    end

    def game_box()
        @@game_box
    end
end    

#Create a command to check the board state to see if anyone has won?
def check_board_state(game_box, player_x, player_o) #Fix Later -- function is repetitive and can use optimization
    check1 = check_rows(game_box)
    p(check1)
    check2 = check_columns(game_box)
    p(check2)
    check3 = check_diagonals(game_box)
    p(check3)
    
    if (check1 == "X") || (check2 == "X") || (check3 == "X")
        call_winner(player_x)
    elsif (check1 == "O") || (check2 == "O") || (check3 == "O")
        call_winner(player_o)
    end
    
end
#Helper functions------------------------------------------------------------
#Calls the winner
def call_winner(player)
    player.add_point()
    puts("#{player.name} Wins") 
end

def check_rows(game_box)
    #Check Rows
    for i in 0...3
        x_count = 0
        o_count = 0
        empty_count = 0
        for boxes in game_box[i]
            box_variable = boxes.variable
            if box_variable == "X"
                x_count += 1
                # puts("X")
            elsif box_variable == "O"
                o_count += 1
                # puts("O")
            else
                # puts("Empty")
            end
        end
        
        if x_count == 3
            return("X")
        elsif o_count == 3
            return("O")
        end
    end
end

def check_columns(game_box)
    #Check Columns    
    for j in 0...3
        x_count = 0
        o_count = 0

        for i in 0...3
            box_variable = game_box[i][j].variable
            if box_variable == "X" 
                x_count += 1
                # puts("X")
            elsif box_variable == "O" 
                o_count += 1
                # puts("O")
            end
            
        end
        if x_count == 3
            return("X")
        elsif o_count == 3
            return("O")
        end
    end
end

def check_diagonals(game_box)
    #Check Diagonals
    x_count = 0
    o_count = 0
    for i in 0...3
        box_variable = game_box[i][-1-i].variable
        if box_variable == "X" 
            x_count += 1
            # puts("X")
        elsif box_variable == "O" 
            o_count += 1
            # puts("O")
        end
        
    end
    
    if x_count == 3
        return("X")
    elsif o_count == 3
        return("O")
    end
    
    x_count = 0
    o_count = 0
    for i in 0...3
        box_variable = game_box[i][i].variable
        if box_variable == "X"
            x_count += 1
            # puts("X")
        elsif box_variable == "O" 
            o_count += 1
            # puts("O")
        else
            # puts("Empty")
        end
    end
    
    if x_count == 3
        return("X")
    elsif o_count == 3
        return("O")
    end
end

player_x = Player.new("Player1", "X") #Has to be either X or O in the second element
player_o = Player.new("Player2", "O")
new_game = GameManager.new(player_x, player_o)
game_box = new_game.game_box

player_o.play(game_box[1][1])
player_x.play(game_box[2][2])
player_o.play(game_box[2][1])
player_x.play(game_box[0][1])
player_o.play(game_box[0][2])
player_x.play(game_box[2][0])
player_o.play(game_box[1][2])
player_x.play(game_box[1][0])
player_o.play(game_box[1][1])

check_board_state(game_box, player_x, player_o)

#Future Work---------------------------------------
#Making it easier to type in tic tac toe values
#Making it check boardstate with every input. Adds points to winning player. #Also resets board at a win or tie
#Creating a turn based system
#Clean Up repetitive code in the "check_board_state" function

