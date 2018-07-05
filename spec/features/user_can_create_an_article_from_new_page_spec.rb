require 'rails_helper'

describe 'a visitor' do
  describe 'visits /articles/new' do
    it 'and can create a new article in the database' do
      article = Article.create!(title: 'Title 1', body: 'Body 1')

      visit articles_path
      click_link 'Create a New Article'

      expect(current_path).to eq(new_article_path)

      fill_in 'article[title]', with: 'New Title!'
      fill_in 'article[body]', with: 'New Body!'
      click_on 'Create Article'
      expect(page).to have_content("Article 'New Title!' created.")
      expect(page).to have_content('New Title!')
      expect(page).to have_content('New Body!')
    end
  end
end
