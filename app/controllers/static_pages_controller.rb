class StaticPagesController < ApplicationController
	respond_to :html, :js
	before_filter :myvars, :only => :index
	
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
		respond_to do |format|
			format.html
			format.js
		end
  end

  def about
  end

  def contact
  end

	def edit
		@animal = Animal.find(params[:id])
		@animal1 = Animal.find(@animal[0].id)
		@animal2 = Animal.find(@animal[1].id)
		@animal1.rating += 1
		@animal2.rating -= 1
		Animal.transaction do
			@animal1.save!
			@animal2.save!
		end
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
