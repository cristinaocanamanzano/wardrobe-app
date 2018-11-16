require 'rails_helper.rb'

RSpec.feature 'selecting two pictures', type: :feature do
  scenario 'A user can select two images and see it on the selection page' do
    sign_up_helper
    add_item('clueless.jpg')
    click_link 'Back'
    add_item('jumpsuit.jpg')
    click_link 'Back'
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumpsuit.jpg']")
  end

  scenario 'Page to compare clothes only shows selected items' do
    sign_up_helper
    add_item('clueless.jpg')
    click_link 'Back'
    add_item('jumpsuit.jpg')
    click_link 'Back'
    add_item('jumper.jpeg')
    click_link 'Back'
    page.check('item-1')
    page.check('item-3')
    click_button 'Submit'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumper.jpeg']")
    expect(page).not_to have_css("img[src*='jumpsuit.jpg']")
  end
end
