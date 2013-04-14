class RemoveLikesAndDislikesFromConfessions < ActiveRecord::Migration
  def change
  	remove_column :confessions, :number_of_likes
  	remove_column :confessions, :number_of_dislikes
  	remove_column :confessions, :number_of_trolls
  end
end
