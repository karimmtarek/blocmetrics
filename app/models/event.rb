# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  created_on :date
#  user_id    :integer
#  source_url :string
#

class Event < ActiveRecord::Base
  belongs_to :user
  has_many :properties, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }

  def self.user_events(user)
    all.where("User_id = ?", user.id)
  end


end
