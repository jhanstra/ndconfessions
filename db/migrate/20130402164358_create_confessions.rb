class CreateConfessions < ActiveRecord::Migration
  def change
    create_table :confessions do |t|
      t.integer :number
      t.text :content
      t.integer :number_of_likes
      t.integer :number_of_dislikes
      t.integer :number_of_trolls

      t.timestamps
    end
  end
end
