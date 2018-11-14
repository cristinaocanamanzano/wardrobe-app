# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'shows sign-up page with email input field' do
    visit '/'
    expect(page).to have_selector('#user_email')
    expect(page).to have_selector('#user_password')
  end

  scenario 'allows a user to sign up' do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', with: 'testemail@gmail.com')
    fill_in('user_password', with: 'password1234')
    fill_in('user_password_confirmation', with: 'password1234')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
