
require 'rails_helper.rb'

RSpec.feature 'clothes_matcher', type: :feature do
  describe 'Tests using Selenium', js: true do

    scenario 'A user can see clothes combinations' do
      sign_up('testuser1@gmail.com')
      add_item("clueless.jpg", 'navy', 'top', 'formal')
      click_link 'Clothes Carousel'
      expect(page).to have_content('Explore your closet')
      expect(page).to have_selector(:id, 'tops-carousel')
      expect(page).to have_selector(:id, 'bottoms-carousel')
    end

    scenario 'A user gets a message for a mismatch outfit' do
      sign_up('testuser1@gmail.com')
      4.times { add_item("clueless.jpg", 'light-blue', 'top', 'formal')}
      3.times { add_item("clueless.jpg", 'yellow', 'bottom', 'formal') }
      click_link 'Clothes Carousel'
      find('#tops-carousel').find('.slick-next').click
      # waiting for javascript to execute message
      sleep 2
      expect(page).to have_content('FASHION VICTIM')
    end

    scenario 'A user gets a happy message for a matched outfit' do
      sign_up('testuser1@gmail.com')
      4.times { add_item("clueless.jpg", 'light-blue', 'top', 'formal') }
      3.times { add_item("clueless.jpg", 'black', 'bottom', 'formal') }
      click_link 'Clothes Carousel'
      find('#tops-carousel').find('.slick-next').click
      # waiting for javascript to execute message
      sleep 2
      expect(page).to have_content('match')
    end

    scenario 'A user cannot mismatch categories' do
      sign_up('testuser1@gmail.com')
      4.times { add_item("clueless.jpg", 'light-blue', 'top', 'formal') }
      3.times { add_item("clueless.jpg", 'black', 'bottom', 'informal') }
      add_item("clueless.jpg", 'black', 'bottom', 'formal')
      click_link 'Clothes Carousel'
      find('#tops-carousel').find('.slick-next').click
      # waiting for javascript to execute message
      sleep 2
      expect(page).to have_content("Bummer, You have put a formal and an informal item together")
      find('#bottoms-carousel').find('.slick-prev').click
      expect(page).to have_content("Dope, These items are meant for the same occasion")
    end

  end

end
