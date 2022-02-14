class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { Array('A'..'Z').sample }
  end

  def score
    @grid = params['grid-letter']
    @word = params['word']
    @grid_array = @grid.chars
    @result = check(@word, @grid_array)
  end

  def check(word, grid)
    word.chars.each do |letter|
      if grid.include?(letter)
        grid - [letter]
      else
        return false
      end
    end
    return true
  end
end
