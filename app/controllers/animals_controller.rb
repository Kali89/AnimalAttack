class AnimalsController < ApplicationController
	respond_to :html, :js
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

	def destroy
		@animal = Animal.find(params[:id])
		@animal.destroy
		respond_to do |format|
			format.html {redirect_to new_animal_path}
			format.js
		end
	end

	def edit
	end

	def update
		@animal = (params[:animal])
		@winningAnimal = Animal.find(params[:id])
		@losingAnimal = Animal.find(@animal.keys[1])
		@winningBefore = @winningAnimal.rating.to_s.dup
		@losingBefore = @losingAnimal.rating.to_s.dup
		@ratingFactor = 15
		@difference = @winningAnimal.rating.abs
		@probWinner = 1/((Math.exp(@difference/60)+1))
		@probLoser = 1 - @probWinner
		@winningAnimal.rating += @ratingFactor * @probWinner
		@losingAnimal.rating += @ratingFactor * -@probLoser
		@winningAnimal.match_count += 1
		@losingAnimal.match_count += 1
		@winningAnimal.matches_won += 1
		Animal.transaction do
			@winningAnimal.save!
			@losingAnimal.save!
		end
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js
		end
	end

end
