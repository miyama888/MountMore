class ArticlesController < ApplicationController
	def index
		@articles = Article.all
		@all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
	end

	def new
		@article = Article.new
		@article.article_images.build
	end

	def create
		@articles = Article.all
		@article =Article.new(article_params)
		@article.user_id =current_user.id
  		@user =current_user

		if @article.save
			redirect_to articles_path(@article)

		else
			render "articles/index"
			
		end
	end

	def edit
		@article = Article.find_by(id: params[:id])
	end

	def update
		@article = Article.find_by(id: params[:id])
		if @article.update(article_params)
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def show
		@article = Article.find_by(id:params[:id])
		@user = @article.user
		@articles = Article.all
		@article_comment = ArticleComment.new
		@images = @article.article_images
	end

	def destroy
		article = Article.find(params[:id])
  		article.destroy
  		redirect_to root_path(article)
	end

	def select_prefecture
    	render partial: 'select_prefecture', locals: {area_id: params[:area_id]}
  	end

  private

  def article_params
    params.require(:article).permit(:title, :body, :prefecture_id, :area_id, article_images_images: [] )
  end

  # def article_image_params
  # 	@article.images = area_id Area.all
  # end
end
