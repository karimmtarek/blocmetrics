# == Schema Information
#
# Table name: domains
#
#  id         :integer          not null, primary key
#  url        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Domain < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true,
                  uniqueness: { case_sensitive: false }
end
