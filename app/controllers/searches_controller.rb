class SearchesController < ApplicationController

def search
	type = params[:search_type]
    method = params[:search_method]
    word = params[:search_word]
    if type == "user_match"
    	@users = User.search(type,method,word)
    	render template: "searches/user_search"
	elsif type == "article_match"
    	@articles = Article.search(type,method,word)
    	render template: "searches/article_search"
	end
end

end
