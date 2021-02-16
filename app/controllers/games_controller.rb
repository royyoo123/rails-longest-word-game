require 'open-uri'
require 'json'

class GamesController < ApplicationController
	def new
		@row = Array.new(10) { ('A'..'Z').to_a.sample }.join(" ")
		# @row = ""
		# @letters.each do |letter|
 	# 		@row += " " + letter

 		
 	end
		# def english_word?(word)
		#   response = open("https://wagon-dictionary.herokuapp.com/#{word}")
		#   json = JSON.parse(response.read)
		#   return json['found']
		# end
		
		# def in_grid?(word, grid)
		#   word.chars.all? { |letter| word.count(letter) <= grid.count(letter) }
		# end
	def score
		@row = params[:row]
		@answer = params[:answer]
		if in_grid?(@answer.upcase, @row.upcase)
			if english_word?(@answer)
				@result = "Congratulations! #{@answer} is in grid."

				@score = get_score(@answer)
			else
				@result = "#{@answer} is not an English word"
			end
		else
			@result = "#{@answer} is not in the grid."
		end
		raise
	end

	private

	def english_word?(word)
		response = open("https://wagon-dictionary.herokuapp.com/#{word}")
		json = JSON.parse(response.read)
		return json['found']
	end

	# def get_score(word)
	# 	word.length ** 3 - word.length * 3
	# end

	def in_grid?(word, grid)
	  word.chars.all? { |letter| word.count(letter) <= grid.count(letter) }
	end
	
end
