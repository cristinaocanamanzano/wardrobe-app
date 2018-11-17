# frozen_string_literal: true

require 'rails_helper.rb'

RSpec.feature 'uploading photos', type: :feature do
  scenario 'A user can upload an image and see it on the items page' do
    sign_up_helper('testuser1@gmail.com')
    add_item("clueless.jpg")
    expect(page).to have_content('Item was successfully created')
    expect(page).to have_content("navy")
    expect(page).to have_css("img[src*='clueless.jpg']")
    click_link 'Back'
    expect(page).to have_css("img[src*='clueless.jpg']")
  end

  scenario "A user cannot see other users' items on the page" do
    sign_up_helper('testuser1@gmail.com')
    add_item("clueless.jpg")
    click_link 'Back'
    click_link 'Logout'
    sign_up_helper('testuser2@gmail.com')
    expect(page).not_to have_css("img[src*='clueless.jpg']")
  end

  scenario 'A user can only see their own pictures on the page' do
    sign_up_helper('testuser1@gmail.com')
    add_item("clueless.jpg")
    click_link 'Back'
    click_link 'Logout'
    sign_up_helper('testuser2@gmail.com')
    add_item("jumpsuit.jpg")
    expect(page).not_to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumpsuit.jpg']")
  end

end
