require 'rails_helper'

RSpec.feature "suggestion index page" do
  scenario 'computer gives suggestion' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'navy', 'bottom', 'formal')
    add_item('jumper.jpeg', 'navy', 'bottom', 'formal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    click_button 'Save combination'
    click_link 'Suggestions'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumpsuit.jpg']")
    expect(page).not_to have_css("img[src*='jumper.jpeg']")
  end
end
