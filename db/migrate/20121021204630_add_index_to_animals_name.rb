class AddIndexToAnimalsName < ActiveRecord::Migration
  def change
		add_index :animals, :name, unique: true
  end
end
