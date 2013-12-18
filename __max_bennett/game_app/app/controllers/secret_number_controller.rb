class SecretNumberController < ApplicationController
	def index
	end

	def show
		@number = rand(5) + 1
		@guess = params[:id].to_i
	end
end