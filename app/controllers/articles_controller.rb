class ArticlesController < ApplicationController
	def index
		@article =Article.new
		@articles = Article.all
	end

	def create
		@articles = Article.all
		@article =Article.new(article_params)
		@article.user_id =current_user.id
  		@user =current_user
		if @article.save
			redirect_to root_path(@article)
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
	end

	def destroy
		article = Article.find(params[:id])
  		article.destroy
  		redirect_to root_path(article)
	end

  private

  def article_params
    params.require(:article).permit(:title, :body )
  end
end
