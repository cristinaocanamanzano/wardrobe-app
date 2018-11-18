require "rails_helper"

RSpec.feature "computer_matches_clothes" do
  scenario 'no colour match' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'navy', 'top', 'formal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("As If! Those colours are 'whatever' together...")
  end

  scenario 'colour match' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'red', 'top', 'formal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("Snaps! Those colours are totally classic together...")
  end

  scenario 'no formal match' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'navy', 'top', 'informal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("You have put a formal and an informal item together")
  end

  scenario "formal match " do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'navy', 'top', 'formal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("These items are meant for the same occasion")
  end
end
