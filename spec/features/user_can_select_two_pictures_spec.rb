require 'rails_helper.rb'

RSpec.feature 'selecting two pictures', type: :feature do
  scenario 'A user can select two images and see it on the selection page' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'navy', 'top', 'formal')
    add_item('jumper.jpeg', 'navy', 'top', 'formal')
    page.check('item-1')
    page.check('item-3')
    click_button 'Submit'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumper.jpeg']")
    expect(page).not_to have_css("img[src*='jumpsuit.jpg']")
  end

end
