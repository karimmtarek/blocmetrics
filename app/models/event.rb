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

 before_create :set_created_on

  DATE_RANGE = [
    'Today',
    'Yesterday',
    'Last week',
    'Last month',
    'Last 3 month',
    'Last 6 month',
    'Last 9 month',
    'Last year'
  ]

  private

  def set_created_on
    self.created_on = Date.today
  end

end
