require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /articles/:id' do
    it 'can click on a tag and see the tag show page' do
      article = Article.create!(title: "New Title", body: "New Body")
      tag = article.tags.create!(name: "Name")

      visit article_path(article)

      click_link tag.name

      expect(current_path).to eq(tag_path(tag))
      expect(page).to have_content(tag.name)
    end
  end
end
