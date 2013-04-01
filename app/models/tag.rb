# == Schema Information
#
# Table name: tags
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  number_of_confessions :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :name, :number_of_confessions
end
