require "rails_helper"

RSpec.feature "computer_matches_clothes" do
  scenario 'no match' do
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
    expect(page).to have_content("Fashion victim alert!!")
  end

  scenario 'match' do
    sign_up_helper
    add_item('clueless.jpg')
    click_link 'Back'
    click_link 'New Item'
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/jumpsuit.jpg'))
    select 'gold', from: 'item[colour]'
    click_button 'Create Item'
    click_link 'Back'
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumpsuit.jpg']")
    expect(page).to have_content("Rollin' with the homies!")
  end

end
