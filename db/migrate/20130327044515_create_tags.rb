class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :number_of_confessions

      t.timestamps
    end
  end
end
