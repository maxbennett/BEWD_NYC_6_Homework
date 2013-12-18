class RockPaperController < ApplicationController
	def index
	 
	end

	def show
       @move = params[:id]
       moves = ["rock", "paper", "scissors"]
       @opponent = moves[rand(moves.length)]
	end
end