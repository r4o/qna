require_relative 'acceptance_helper'

feature 'User sign in', %q{
  In order to be able to ask question
  As an user
  I want do be able to sign in
} do

  given(:user) { create(:user) }

  scenario 'Registered user try to sign in' do
    sign_in(user)

    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'Not-registered user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@user.com'
    fill_in 'Password', with: '12345'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password'
  end
end