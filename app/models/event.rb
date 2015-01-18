class Event < ActiveRecord::Base
  has_many :properties

  validates :name, presence: true, length: { minimum: 5 }
end
