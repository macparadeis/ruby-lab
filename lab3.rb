require_relative "element"
require_relative "player"
require_relative "history"

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  Mackenzie Paradeis				 	#
#  paradeim@oregonstate.edu	            #
#										#
#########################################



def select_players
	# Selects both players
	puts "Please choose two players:"
	puts "(1) StupidBot\n(2) RandomBot\n(3) IterativeBot\n(4) LastPlayBot\n(5) Human"
	loop do
	  
	  print "Select Player 1: "
	  choice1 = gets.chomp.to_i
	  print "Select Player 2: "
	  choice2 = gets.chomp.to_i
  
	  if choice1.between?(1, 5) && choice2.between?(1, 5)
		player1 = case choice1
				  when 1 then StupidBot.new("StupidBot", History.new)
				  when 2 then RandomBot.new("RandomBot", History.new)
				  when 3 then IterativeBot.new("IterativeBot", History.new)
				  when 4 then LastPlayBot.new("LastPlayBot", History.new)
				  when 5 then Human.new("Human", History.new)
				  end
  
		player2 = case choice2
				  when 1 then StupidBot.new("StupidBot", History.new)
				  when 2 then RandomBot.new("RandomBot", History.new)
				  when 3 then IterativeBot.new("IterativeBot", History.new)
				  when 4 then LastPlayBot.new("LastPlayBot", History.new)
				  when 5 then Human.new("Human", History.new)
				  end
				  
		puts "#{player1.name} vs. #{player2.name}"
		return player1, player2
	  else
		puts "Invalid choice(s) - start over"
	  end
	end
  end

  
def play_round(player1, player2)
	move1 = player1.play
	move2 = player2.play

	# Log the moves for history
	player1.history.log_play(move1)
	player2.history.log_play(move2)
  
	player1.history.log_opponent_play(move2)
	player2.history.log_opponent_play(move1)
  

	puts "Player 1 chose #{move1.name}"
	puts "Player 2 chose #{move2.name}"
  
	result, outcome = move1.compare_to(move2)
	puts result
  
	if outcome == "Win"
	  player1.history.add_score
	  puts "Player 1 won the round"
	elsif outcome == "Lose"
	  player2.history.add_score
	  puts "Player 2 won the round"
	else
	  puts "Round was a tie"
	end
  end


def main
	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	puts
	
	player1, player2 = select_players
  
	5.times do |round|
	  puts "\nRound #{round + 1}:"
	  play_round(player1, player2)
	end
  
	puts "\nFinal score is #{player1.history.score} to #{player2.history.score}"
	if player1.history.score > player2.history.score
		puts "Player 1 wins"
	elsif player2.history.score > player1.history.score
		puts "Player 2 wins"

	else
	  puts "Game was a draw"
	end
  end
  
  main if __FILE__ == $PROGRAM_NAME
  