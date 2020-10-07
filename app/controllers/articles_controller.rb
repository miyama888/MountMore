class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]
  def index
    # compareFavorite = 0
    # j  = 1
    @articles = Article.all
    @articles_c = Article.all.page(params[:page]).per(6).order(created_at: :desc)
    @all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
    # 全画像情報取得
    @images = ArticleImage.all.order(created_at: :desc).limit(10)
  end

  def new
    @article = Article.new
    @article.article_images.build
  end

  def create
    @articles = Article.all
    @article = Article.new(article_params)
    @article.score = Language.get_data(article_params[:body])
    @article.user_id = current_user.id
    @user = current_user
    if @article.save
       @article.article_images.each do |article_image|
        tags = Vision.get_image_data(article_image.image)
        tags.each do |tag|
          article_image.tags.create(name: tag['description'], score: tag['score'])
        end
       end
       redirect_to article_path(@article), notice: "記事を投稿しました。"
    else
       render :new
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.score = Language.get_data(article_params[:body])
    if @article.update(article_params)
        unless article_params[:article_images_images].nil?
         @article.article_images.each do |article_image|
          tags = Vision.get_image_data(article_image.image)
          tags.each do |tag|
            article_image.tags.create(name: tag['description'], score: tag['score'])
          end
         end
       end
      redirect_to article_path(@article), notice: "記事を更新しました。"
    else
      render :edit
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    @user = @article.user
    @articles = Article.all
    @article_comment = ArticleComment.new
    @images = @article.article_images
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path(article), notice: "記事を削除しました。"
  end

  def select_prefecture
    render partial: 'select_prefecture', locals: { area_id: params[:area_id] }
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :prefecture_id, :area_id, :latitude, :longitude, article_images_images: [])
  end

  def ensure_correct_user
    @article = Article.find(params[:id])
    unless @article.user == current_user
      redirect_to articles_path
    end
  end
end
