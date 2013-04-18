class Confession < ActiveRecord::Base
  self.per_page = 200
  attr_accessible :content, :number_of_likes, :number_of_dislikes, :total_votes
  validates :content, presence: true

  acts_as_voteable

  scope :popular, lambda {|start_date=Date.today, end_date=Date.today.end_of_day|
    plusminus_tally
      .where('confessions.created_at > :start_date AND confessions.created_at <= :end_date',
             {start_date: start_date, end_date: end_date})
  }

  scope :popular_recently, lambda {
    popular(2.hours.ago)
  }

  scope :popular_this_week, lambda {
    popular(7.days.ago)
  }

  scope :popular_all_time, lambda {
    popular(3000.days.ago)
  }
end
