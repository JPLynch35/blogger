require 'rails_helper'

describe 'a visitor' do
  describe 'visits /articles/:id' do
    it 'and can delete the viewed article' do
      article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
      article_2 = Article.create!(title: 'Title 2', body: 'Body 2')

      visit article_path(article_2)
      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      expect(page).to have_content("Article '#{article_2.title}' deleted.")
      expect(page).to have_content(article_1.title)
    end
  end
end
