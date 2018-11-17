
require 'rails_helper.rb'

RSpec.feature 'editing items', type: :feature do
  scenario 'A user can edit the color of the item' do
    sign_up('testuser1@gmail.com')
    add_item("clueless.jpg", 'navy', 'top')
    expect(page).to have_content("navy")
    expect(page).to have_css("img[src*='clueless.jpg']")
    click_link 'Edit'
    select 'red', from: 'item[colour]'
    click_button 'Update Item'
    expect(page).to have_content("red")
  end
end
