require 'rails_helper'

describe "A user" do
  it "should be able to sign-up using email/password" do
    user = User.new(email: "karim@tarek.com", password: "password", password_confirmation: "password")
    user.save!
  end
end