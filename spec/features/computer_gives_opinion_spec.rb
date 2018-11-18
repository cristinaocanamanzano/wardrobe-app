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
    expect(page).to have_content("Bummer: You have put a formal and an informal item together")
  end

  scenario "formal match " do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'navy', 'top', 'formal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("Dope: These items are meant for the same occasion")
  end


  scenario "formal match " do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'navy', 'top', 'formal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("Dope: These items are meant for the same occasion")
  end

  scenario "everything matches match" do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'pink', 'top', 'formal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("Rollin' with the hommies! Check it, you look great")
  end

  scenario "formal doesn't match match" do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top', 'formal')
    add_item('jumpsuit.jpg', 'pink', 'top', 'informal')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("Fashion victim...Please rethink your style choice")
  end

end
