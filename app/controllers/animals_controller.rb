class AnimalsController < ApplicationController
  def new
		@animal = Animal.new
  end

	def create
		@animal = Animal.new(params[:animal])
		if @animal.save
			redirect_to @animal
		else
			render 'new'
		end
	end

	def show
		@animal = Animal.find(params[:id])
	end

	def index
		@animal = Animal.all
	end
end
