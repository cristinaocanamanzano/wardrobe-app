# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'shows sign-up page with email input field' do
    visit '/'
    expect(page).to have_selector('#user_email')
    expect(page).to have_selector('#user_password')
  end

  scenario 'allows a user to sign up' do
    sign_up_helper
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
