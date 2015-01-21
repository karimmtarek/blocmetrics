# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  key        :string
#  value      :string
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Property < ActiveRecord::Base
  belongs_to :event
end
