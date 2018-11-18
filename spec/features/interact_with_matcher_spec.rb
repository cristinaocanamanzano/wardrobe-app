
require 'rails_helper.rb'

RSpec.feature 'clothes_matcher', type: :feature do
  describe 'Tests using Selenium', js: true do

    scenario 'A user can see clothes combinations' do
      sign_up('testuser1@gmail.com')
      add_item("clueless.jpg", 'navy', 'top', 'formal')
      click_link 'Explore'
      expect(page).to have_content('Explore your closet')
      expect(page).to have_selector(:id, 'tops-carousel')
      expect(page).to have_selector(:id, 'bottoms-carousel')
    end

    scenario 'A user gets a message for a mismatch outfit' do
      sign_up('testuser1@gmail.com')
      4.times { add_item("clueless.jpg", 'light-blue', 'top', 'formal')}
      3.times { add_item("clueless.jpg", 'yellow', 'bottom', 'formal') }
      click_link 'Explore'
      find('#tops-carousel').find('.slick-next').click
      # waiting for javascript to execute message
      sleep 2
      expect(page).to have_content('FASHION VICTIM')
    end

    scenario 'A user gets a happy message for a matched outfit' do
      sign_up('testuser1@gmail.com')
      4.times { add_item("clueless.jpg", 'light-blue', 'top', 'formal') }
      3.times { add_item("clueless.jpg", 'black', 'bottom', 'formal') }
      click_link 'Explore'
      find('#tops-carousel').find('.slick-next').click
      # waiting for javascript to execute message
      sleep 2
      expect(page).to have_content('match')
    end

  end

end
