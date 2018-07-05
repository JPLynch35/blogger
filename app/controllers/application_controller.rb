class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  private
  def set_article
    @article = Article.find(params[:id])  
  end
end
