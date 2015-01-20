class Event < ActiveRecord::Base
  belongs_to :user
  has_many :properties, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
end
