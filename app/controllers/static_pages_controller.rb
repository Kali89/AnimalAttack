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

	def league
		@premier_league = Animal.all(:limit => 10)
		respond_to do |format|
			format.html
			format.js
		end
	end

end
