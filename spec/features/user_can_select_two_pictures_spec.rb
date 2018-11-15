require 'rails_helper.rb'

RSpec.feature 'selecting two pictures', type: :feature do
  scenario 'A user can select two images and see it on the selection page' do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', with: 'testemail@gmail.com')
    fill_in('user_password', with: 'password1234')
    fill_in('user_password_confirmation', with: 'password1234')
    click_button('Sign up')
    visit '/items'
    click_link 'New Item'
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/clueless.jpg'))
    select 'blue', from: 'item[colour]'
    click_button 'Create Item'
    click_link 'Back'
    click_link 'New Item'
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/jumpsuit.jpg'))
    select 'blue', from: 'item[colour]'
    click_button 'Create Item'
    click_link 'Back'
    page.check('item-1')
    page.check('item-2')
    click_button 'Submit'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumpsuit.jpg']")
  end

  scenario 'Page to compare clothes only shows selected items' do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', with: 'testemail@gmail.com')
    fill_in('user_password', with: 'password1234')
    fill_in('user_password_confirmation', with: 'password1234')
    click_button('Sign up')
    visit '/items'
    click_link 'New Item'
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/clueless.jpg'))
    select 'blue', from: 'item[colour]'
    click_button 'Create Item'
    click_link 'Back'
    click_link 'New Item'
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/jumpsuit.jpg'))
    select 'blue', from: 'item[colour]'
    click_button 'Create Item'
    click_link 'Back'
    click_link 'New Item'
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/jumper.jpeg'))
    select 'red', from: 'item[colour]'
    click_button 'Create Item'
    click_link 'Back'
    save_and_open_page
    page.check('item-1')
    page.check('item-3')
    click_button 'Submit'
    expect(page).to have_css("img[src*='clueless.jpg']")
    expect(page).to have_css("img[src*='jumper.jpeg']")
    expect(page).not_to have_css("img[src*='jumpsuit.jpg']")
  end
end
