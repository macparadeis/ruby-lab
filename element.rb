# Author: Mackenzie Paradeis
# Date: 5/13/24
# Course: CS 381
# Project: Lab 3 - Ruby

class Element
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def compare_to(other)
      fail "This method should be overridden"
    end
  end
  
  class Rock < Element
    def compare_to(other)
      case other.name
      when 'Rock' then ["Rock equals Rock", "Tie"]
      when 'Paper' then ["Paper covers Rock", "Lose"]
      when 'Scissors' then ["Rock crushes Scissors", "Win"]
      when 'Lizard' then ["Rock crushes Lizard", "Win"]
      when 'Spock' then ["Spock vaporizes Rock", "Lose"]
      else fail "Unknown element"
      end
    end
  end
  
  class Paper < Element
    def compare_to(other)
      case other.name
      when 'Rock' then ["Paper covers Rock", "Win"]
      when 'Paper' then ["Paper equals Paper", "Tie"]
      when 'Scissors' then ["Scissors cut Paper", "Lose"]
      when 'Lizard' then ["Lizard eats Paper", "Lose"]
      when 'Spock' then ["Paper disproves Spock", "Win"]
      else fail "Unknown element"
      end
    end
  end
  
  class Scissors < Element
    def compare_to(other)
      case other.name
      when 'Rock' then ["Rock crushes Scissors", "Lose"]
      when 'Paper' then ["Scissors cut Paper", "Win"]
      when 'Scissors' then ["Scissors equals Scissors", "Tie"]
      when 'Lizard' then ["Scissors decapitate Lizard", "Win"]
      when 'Spock' then ["Spock smashes Scissors", "Lose"]
      else fail "Unknown element"
      end
    end
  end
  
  class Lizard < Element
    def compare_to(other)
      case other.name
      when 'Rock' then ["Rock crushes Lizard", "Lose"]
      when 'Paper' then ["Lizard eats Paper", "Win"]
      when 'Scissors' then ["Scissors decapitate Lizard", "Lose"]
      when 'Lizard' then ["Lizard equals Lizard", "Tie"]
      when 'Spock' then ["Lizard poisons Spock", "Win"]
      else fail "Unknown element"
      end
    end
  end
  
  class Spock < Element
    def compare_to(other)
      case other.name
      when 'Rock' then ["Spock vaporizes Rock", "Win"]
      when 'Paper' then ["Paper disproves Spock", "Lose"]
      when 'Scissors' then ["Spock smashes Scissors", "Win"]
      when 'Lizard' then ["Lizard poisons Spock", "Lose"]
      when 'Spock' then ["Spock equals Spock", "Tie"]
      else fail "Unknown element"
      end
    end
  end
  
  # Create and store instances in a global list
  $elements = [Rock.new('Rock'), Paper.new('Paper'), Scissors.new('Scissors'), Lizard.new('Lizard'), Spock.new('Spock')]
  