class Addmatcheswon < ActiveRecord::Migration
  def up
		add_column :animals, :matches_won, :integer, :default => 0
  end

  def down
  end
end
