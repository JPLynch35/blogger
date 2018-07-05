require 'rails_helper'

describe 'a visitor' do
  describe 'visits /article/:id and clicks on edit' do
    it 'and is then able to edit an article' do
      article = Article.create!(title: 'Title 1', body: 'Body 1')

      visit article_path(article)
      click_link 'Edit'

      expect(current_path).to eq(edit_article_path(article))

      fill_in 'article[title]', with: 'Newer Title'
      fill_in 'article[body]', with: 'Updated Body'
      click_on 'Update Article'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Article 'Newer Title' updated.")
      expect(page).to have_content('Newer Title')
      expect(page).to have_content('Updated Body')
    end
  end
end
