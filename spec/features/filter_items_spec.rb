# frozen_string_literal: true
require 'rails_helper.rb'

RSpec.feature 'Items filter', type: :feature do
  describe 'User is able to filter items by colour and occasion', js: true do
    scenario 'Users can filter what they see by colour' do
      sign_up('testuser1@gmail.com')
      add_item("clueless.jpg", 'navy', 'top', 'formal')
      add_item("jumper.jpeg", 'yellow', 'bottom', 'formal')
      add_item("jumpsuit.jpg", 'navy', 'bottom', 'formal')
      page.check('navy')
      expect(page).to have_css("img[src*='clueless.jpg']")
      expect(page).to have_css("img[src*='jumpsuit.jpg']")
      expect(page).not_to have_css("img[src*='jumper.jpeg']")
    end

    scenario 'Users can filter by occasion' do
      sign_up('testuser1@gmail.com')
      add_item("clueless.jpg", 'navy', 'top', 'formal')
      add_item("jumper.jpeg", 'yellow', 'bottom', 'informal')
      add_item("jumpsuit.jpg", 'navy', 'bottom', 'informal')
      page.check('formal')
      expect(page).to have_css("img[src*='clueless.jpg']")
      expect(page).not_to have_css("img[src*='jumpsuit.jpg']")
      expect(page).not_to have_css("img[src*='jumper.jpeg']")
    end

    scenario 'Users can filter by occasion' do
      sign_up('testuser1@gmail.com')
      add_item("clueless.jpg", 'navy', 'top', 'formal')
      add_item("jumper.jpeg", 'yellow', 'bottom', 'informal')
      add_item("jumpsuit.jpg", 'navy', 'bottom', 'informal')
      page.check('formal')
      click_button 'Clear all'
      expect(page).to have_css("img[src*='clueless.jpg']")
      expect(page).to have_css("img[src*='jumpsuit.jpg']")
      expect(page).to have_css("img[src*='jumper.jpeg']")
    end
  end
end
