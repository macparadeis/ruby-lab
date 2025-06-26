# Author: Mackenzie Paradeis
# Date: 5/13/24
# Course: CS 381
# Project: Lab 3 - Ruby

class History
    attr_accessor :plays, :opponent_plays, :score
  
    def initialize
      @plays = []
      @opponent_plays = []
      @score = 0
    end
  
    def log_play(move)
      @plays << move
    end
  
    def log_opponent_play(move)
      @opponent_plays << move
    end
  
    def add_score
      @score += 1
    end
  end
  