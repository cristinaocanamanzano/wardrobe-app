require 'rails_helper'

RSpec.feature "suggestion index page" do
 describe "Random suggestions", js: true do
  scenario 'computer gives suggestion' do
    sign_up('testuser1@gmail.com')
    4.times { add_item("clueless.jpg", 'light-blue', 'top', 'formal')}
    2.times { add_item("jumper.jpeg", 'yellow', 'bottom', 'formal') }
    add_item("jumpsuit.jpg", 'yellow', 'bottom', 'formal')
    click_link 'Clothes Carousel'
    find('#tops-carousel').find('.slick-next').click
    click_button 'Save combination'
    click_link 'Suggestions'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumper.jpeg']")
    expect(page).not_to have_css("img[src*='jumpsuit.jpg']")
  end

  scenario 'user has not saved any favourite combination yet' do
    sign_up('testuser1@gmail.com')
    click_link 'Suggestions'
    expect(page).to have_content("You have not saved any favourite combination yet.")
  end
 end
end
