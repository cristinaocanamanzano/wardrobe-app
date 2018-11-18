# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'computer_matches_clothes' do
  scenario 'no match' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top')
    add_item('jumpsuit.jpg', 'navy', 'top')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content('Fashion victim alert!!')
  end

  scenario 'match' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top')
    add_item('jumpsuit.jpg', 'red', 'top')
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_content("Rollin' with the homies!")
  end
end
