# frozen_string_literal: true

require 'rails_helper.rb'

RSpec.feature 'uploading photos', type: :feature do
  scenario 'A user can upload an image and see it on the items page' do
    sign_up_helper
    add_item("clueless.jpg")
    expect(page).to have_content('Item was successfully created')
    expect(page).to have_content("blue")
    expect(page).to have_css("img[src*='clueless.jpg']")
    click_link 'Back'
    expect(page).to have_css("img[src*='clueless.jpg']")
  end
end
