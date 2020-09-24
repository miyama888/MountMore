class FavoritesController < ApplicationController
  def create
    @article = Article.find_by(id: params[:article_id])
    @favorite = current_user.favorites.new(article_id: @article.id)
    @favorite.save
  end

  def destroy
    @article = Article.find_by(id: params[:article_id])
    @favorite = current_user.favorites.find_by(article_id: @article.id)
    @favorite.destroy
  end
end
