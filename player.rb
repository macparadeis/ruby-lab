# Author: Mackenzie Paradeis
# Date: 5/13/24
# Course: CS 381
# Project: Lab 3 - Ruby

require_relative 'element'
require_relative 'history'

class Player
  attr_reader :name, :history

  def initialize(name, history)
    @name = name
    @history = history
  end

  def play
    fail "This method should be overridden"
  end
end

class StupidBot < Player
    # Always plays Rock
  def play
    move = $elements[0]
    @history.log_play(move)
    move
  end
end

class RandomBot < Player
    # Chooses randomly
  def play
    move = $elements.sample
    @history.log_play(move)
    move
  end
end

class IterativeBot < Player
    # Chooses a random start and then iterates through all moves in order
  def initialize(name, history)
    super(name, history)
    @index = 0
  end

  def play
    move = $elements[@index]
    @history.log_play(move)
    @index = (@index + 1) % $elements.length
    move
  end
end

class LastPlayBot < Player
    # Starts with Rock, then copies the opponent's previous move
  def play
    if @history.opponent_plays.empty?
      move = $elements[0] # Play Rock first
    else
      move = @history.opponent_plays.last # Copy last opponent move
    end
    @history.log_play(move)
    move
  end
end

class Human < Player
    # Human player that must choose each round
  def play
    puts "(1) Rock \n(2) Paper \n(3) Scissors \n(4) Lizard \n(5) Spock "
    print "Enter your move: "
    input = gets.chomp.to_i

    # Validates move
    until input.between?(1, 5)
      puts "Invalid move - try again"
      puts "(1) Rock \n(2) Paper \n(3) Scissors \n(4) Lizard \n(5) Spock "
      print "Enter your move: "
      input = gets.chomp.to_i
    end

    move = $elements[input - 1]
    @history.log_play(move)
    move
  end
end
