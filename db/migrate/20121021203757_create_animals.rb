class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :blurb
      t.integer :rating

      t.timestamps
    end
  end
end
