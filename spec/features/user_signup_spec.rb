require 'rails_helper'

describe "A user" do
  it "should be able to sign-up using email/password" do
    visit new_user_path
    fill_in 'Email', :with => 'karim@tarek.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'

    click_on 'Create User'

    expect(page.current_url).to eq(users_url)
    expect(page).to have_content('Thanks for signing up.')
  end
end