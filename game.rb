# Initialize the current player and turn
require './player'
require './question'

class Game
  attr_accessor :name, :player1, :player2

  def initialize
    @turn = 1
    @question = Question.new(@turn)
  end

  def start_game
    puts "New game started. Welcome Player 1 and Player 2"
    @question.start_turn(@turn)
  end

end