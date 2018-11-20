# frozen_string_literal: true
require 'rails_helper.rb'

RSpec.feature 'Items filter', type: :feature do
  describe 'User is able to filter items by colour and occasion', js: true do
    scenario 'Users can choose a colour in the filter and only see items which match this' do
      sign_up('testuser1@gmail.com')
      add_item("clueless.jpg", 'navy', 'top', 'formal')
      add_item("jumper.jpeg", 'yellow', 'bottom', 'formal')
      add_item("jumpsuit.jpg", 'navy', 'bottom', 'formal')
      page.check('navy')
      expect(page).to have_css("img[src*='clueless.jpg']")
      expect(page).to have_css("img[src*='jumpsuit.jpg']")
      expect(page).not_to have_css("img[src*='jumper.jpeg']")
    end
  end
end
