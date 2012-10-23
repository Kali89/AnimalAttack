class StaticPagesController < ApplicationController
  def index
		@allAnimals = Animal.all
		@random_no = rand(@allAnimals.length)
		@animal = @allAnimals[@random_no]
		@allAnimals.delete_at(@random_no)
		@newRandom = rand(@allAnimals.length)
		@animal2 = @allAnimals[@newRandom]
  end

  def help
  end

  def about
  end

  def contact
  end

	def league
	end
end
