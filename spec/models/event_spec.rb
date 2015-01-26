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

require 'rails_helper'

describe "An Event" do
  it "name is requred" do
    event = Event.new()

    expect(event.valid?).to be_falsey
  end

  it "name's is 5 letters or more" do
    event = Event.new(name: 'four')

    expect(event.valid?).to be_falsey
  end

  it "can have one property or more" do
    event = Event.new(name: 'new event')
    event.properties.new(key: 'key_1', value: 'value_1')
    event.properties.new(key: 'key_2', value: 'value_2')
    event.save!

    expect(event.properties.size).to eq(2)
  end
end
