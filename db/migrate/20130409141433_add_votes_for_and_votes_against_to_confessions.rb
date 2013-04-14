class AddVotesForAndVotesAgainstToConfessions < ActiveRecord::Migration
  def change
    add_column :confessions, :votes_up, :integer
    add_column :confessions, :votes_down, :integer
  end
end
