# frozen_string_literal: true

require 'rails_helper.rb'

RSpec.feature 'clothes_matcher', type: :feature do
  scenario 'A user can see clothes combinations' do
    sign_up('testuser1@gmail.com')
    add_item('clueless.jpg', 'navy', 'top')
    click_link 'Explore'
    expect(page).to have_content('Explore your closet')
    expect(page).to have_selector(:id, 'tops-carousel')
    expect(page).to have_selector(:id, 'bottoms-carousel')
  end
end
