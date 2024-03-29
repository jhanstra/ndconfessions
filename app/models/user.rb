# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :username, :name, :password, :password_confirmation
  has_secure_password

  # before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, presence:true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  acts_as_voter
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
