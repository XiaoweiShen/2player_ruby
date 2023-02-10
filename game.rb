require_relative "question"
require_relative "player"

class Game
  def initialize
    player1 = Player.new
    player2 = Player.new
    @players= [player1,player2]
    @round = 0
    newround(@round)
  end
  def newround(round)
    puts "----------------NEW TURN (round#{round})---------------"
    
    @player_selector = round%2
    @current_player = @players[@player_selector]
    @question = Question.new
    puts "Player #{@player_selector+1}: #{@question.question}"
    @answer = gets.chomp.to_i
    check(@answer)
  end
  
  def check(answer)
    if answer == @question.answer
      puts "Player #{@player_selector+1}: YES! You are correct!"
      @round+=1
      @players[0].inspect
      @players[1].inspect
      newround(@round)
    else
      if @current_player.currentLife == 1
        winner = @players[1 - @player_selector] 
        puts "Player #{2 - @player_selector} wins with a score of #{winner.currentLife}/3"
        puts "-------GAME OVER---------"
        puts "Good bye!"
      else
        @current_player.currentLife=@current_player.currentLife-1
        @round+=1
        puts "Player #{@player_selector+1}: Seriously? No!"
        puts "P1: #{@players[0].currentLife}/3   P2: #{@players[1].currentLife}/3"
        newround(@round)
      end
    end
  end
end

