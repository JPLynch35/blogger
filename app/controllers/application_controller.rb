class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def set_article
    @article = Article.find(params[:id])  
  end
end
