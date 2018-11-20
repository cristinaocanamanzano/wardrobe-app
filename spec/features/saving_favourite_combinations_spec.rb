require "rails_helper"

RSpec.feature "Saving Combinations" do
  describe "User can save combinations and see them", js: true do
    scenario "User can save a favourite combination in the clothes carousel" do
      sign_up("test@test.com")
      4.times { add_item("clueless.jpg", 'light-blue', 'top', 'formal')}
      2.times { add_item("jumper.jpeg", 'yellow', 'bottom', 'formal') }
      add_item("jumpsuit.jpg", 'yellow', 'bottom', 'formal')
      click_link 'Clothes Carousel'
      find('#tops-carousel').find('.slick-next').click
      click_button 'Save combination'
      click_link 'Favourites'
      expect(page).to have_css("img[src*='clueless.jpg']")
      expect(page).to have_css("img[src*='jumper.jpeg']")
      expect(page).not_to have_css("img[src*='jumpsuit.jpg']")
    end
  end
end
