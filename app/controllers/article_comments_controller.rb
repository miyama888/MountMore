class ArticleCommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = current_user.article_comments.new(article_comment_params)
    comment.article_id = article.id
    if comment.save
      redirect_to article_path(article), notice: "コメントを投稿しました。"
    else
      redirect_to request.referer, notice: "コメントが空欄です。コメントを入力してください。"
    end
  end

  def destroy
    ArticleComment.find_by(id: params[:id], article_id: params[:article_id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def article_comment_params
    params.require(:article_comment).permit(:comment)
  end
end
