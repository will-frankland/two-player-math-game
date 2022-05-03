require './player'
require './game'


# Random number generator
class Question
  attr_accessor :turn_update

  def initialize(turn)
    @player1 = 3
    @player2 = 3
    @turn = 1
    @randomNumber1 = 0
    @randomNumber2 = 0
  end
  
  def start_turn(turn)
    @randomNumber1 = rand(1..20)
    @randomNumber2 = rand(1..20)
    @answer = @randomNumber1 + @randomNumber2
    puts "----- NEW TURN -----"
    puts "Player #{@turn} What does #{@randomNumber1} plus #{@randomNumber2} equal?"
    print "> "
    answer = $stdin.gets.chomp

    
    # Logic for updating turn
    def turn_update(turn)
      if turn == 1
        @turn = 2
      else 
        @turn = 1
      end
      start_turn(@turn)
    end

    # Logic for game over
    def game_over
      if @player1 > @player2
        puts "Player 1 wins with a score of #{@player1}/3"
        puts "----- GAME OVER -----"
        puts "Get atta heyyaaaa!"
        exit
      else
        puts "Player 2 wins with a score of #{@player2}/3"
        puts "----- GAME OVER -----"
        puts "Get atta heyyaaaa!"
        exit
      end
    end
    
    # Logic for modifying lives
    def modify_lives
      if @turn == 1
        @player1 -= 1
      else
        @player2 -= 1
      end
      if @player1 == 0  || @player2 == 0
        game_over
      end
      turn_update(@turn)
    end
    
    if answer.to_i == @answer
      puts "Player #{@turn}, YES! You are correct."
      turn_update(@turn)
    else
      puts "Player #{@turn}: Seriously? No!"
      modify_lives
    end



  end
end