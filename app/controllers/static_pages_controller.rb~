class StaticPagesController < ApplicationController
	respond_to :html, :js
	before_filter :myvars
	
	def myvars	
		@allAnimals = Animal.all
		@animal, @animal2 = @allAnimals.sample(2)
	end

  def index
		respond_to do |format|
			format.html
			format.js
		end
	end

  def help
  end

  def about
  end

  def contact
  end

	def league
	end

	def voting
		@votedAnimal = Animal.find(params[:id])
		if @votedAnimal == @animal
			@animal.rating += 1
			@animal2.rating -= 1
		else
			@animal.rating -= 1
			@animal2.rating += 1	
		end
		Animal.transaction do
			@animal.save!
			@animal2.save!
		end
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js  
		end
	end
end
