class AddTotalVotesToConfessions < ActiveRecord::Migration
  def change
    add_column :confessions, :total_votes, :integer
  end
end
