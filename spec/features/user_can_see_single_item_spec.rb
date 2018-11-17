
require 'rails_helper.rb'

RSpec.feature 'viewing individual items', type: :feature do
  scenario 'A user can click on an image and see it by itself' do
    sign_up_helper('testuser1@gmail.com')
    add_item("clueless.jpg")
    click_link 'Back'
    click_link 'Show'
    expect(page).to have_content('Back')
    expect(page).to have_css("img[src*='clueless.jpg']")
  end
end
