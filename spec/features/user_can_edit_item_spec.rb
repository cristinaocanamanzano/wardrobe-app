# frozen_string_literal: true

require 'rails_helper.rb'

RSpec.feature 'editing items', type: :feature do
  scenario 'A user can edit the color and type of the item' do
    sign_up('testuser1@gmail.com')
    add_item("clueless.jpg", 'navy', 'top', 'formal')
    click_link 'Edit'
    select 'red', from: 'item[colour]'
    select 'bottom', from: 'item[clothes_type]'
    click_button 'Update Item'
    sleep 20
    expect(page).to have_content('red')
  end
end
