class Confession < ActiveRecord::Base
  attr_accessible :content, :number_of_likes, :number_of_dislikes, :total_votes
  validates :content, presence: true

  acts_as_voteable

  scope :popular, lambda {|start_date=Date.today, end_date=Date.today.end_of_day|
    plusminus_tally
      .where('votes.created_at > :start_date AND votes.created_at <= :end_date',
             {start_date: start_date, end_date: end_date})
  }

  scope :popular_this_week, lambda {
    popular(7.days.ago)
  }

  scope :popular_this_month, lambda {
    popular(30.days.ago)
  }
end
