require 'rails_helper.rb'

RSpec.feature 'uploading photos', type: :feature do

  scenario 'A user can upload an image' do
    visit ("/items")
    expect(page).to have_content('Items')
    click_link ("New Item")
    expect(page).to have_content('New Item')
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/clueless.jpg'))
    fill_in "item[colour]", with: "Blue"
    click_button "Create Item"
    expect(page).to have_content('Item was successfully created')
    expect(page).to have_css("img[src*='clueless.jpg']")
  end

end
