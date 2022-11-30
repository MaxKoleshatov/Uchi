#  frozen_string_literal: true

require 'rails_helper'

feature 'The user can create article' do
  describe 'Authenticated user' do
    given(:user) { create(:user) }

    scenario 'Authenticated user can create a article' do

    sign_in(user)
    click_on "Articles"
    click_on "Create new article"
          
    fill_in 'Title', with: 'Some ArticleTitle'
    fill_in 'Body', with: 'Some ArticleBody'
    click_on 'Create'
    
    expect(page).to have_content 'Some ArticleTitle'
    end

    scenario 'Authenticated user cant create a article for misstake ' do
      sign_in(user)
      click_on "Articles"
      click_on "Create new article"

      click_on 'Create'
      expect(page).to have_content "Title can't be blank"
    end
  end

  describe 'Unregistered user' do
    given!(:article){create(:article)}
    scenario "Unregistered user cant create a new article, but he see all articles" do

    visit root_path
    click_on "Articles"
      
    expect(page).not_to have_link 'Create new article'
    expect(page).to have_content article.title
    end 
  end
end