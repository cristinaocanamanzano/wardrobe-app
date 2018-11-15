require "rails_helper"

RSpec.feature 'deleting photos' do
  scenario 'user can delete photos' do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', with: 'testemail@gmail.com')
    fill_in('user_password', with: 'password1234')
    fill_in('user_password_confirmation', with: 'password1234')
    click_button('Sign up')
    click_link 'New Item'
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/clueless.jpg'))
    select 'blue', from: 'item[colour]'
    click_button 'Create Item'
    click_link 'Back'
    expect(page).to have_css("img[src*='clueless.jpg']")
    click_link 'Destroy'
    expect(page).not_to have_css("img[src*='clueless.jpg']")
  end

end
