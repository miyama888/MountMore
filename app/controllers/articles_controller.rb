class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
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
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def show
		@article = Article.find(params[:id])
		@user = @article.user
		@articles = Article.all
		@article_comment = ArticleComment.new
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
    params.require(:article).permit(:title, :body, :prefecture_id, :area_id )
  end
end
