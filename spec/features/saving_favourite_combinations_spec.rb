require "rails_helper"

RSpec.feature "Saving Combinations" do
  scenario "User can save a favourite combination" do
    sign_up("test@test.com")
    add_item('clueless.jpg', 'navy', 'top')
    add_item('jumper.jpeg', 'pink', 'top')
    add_item('jumpsuit.jpg', 'purple', 'top')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    click_button 'Save combination'
    visit('/combinations')
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumper.jpeg']")
    expect(page).not_to have_css("img[src*='jumpsuit.jpg']")
  end
end
