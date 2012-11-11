class Addcountofmatch < ActiveRecord::Migration
  def up
		add_column :animals, :match_count, :integer, :default => 0
  end

  def down
  end
end
