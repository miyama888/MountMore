class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(type,method,word)
    if type == "user_match"
              if method == "forward_match"
                      @users = User.where("name LIKE?","#{word}%")
              elsif method == "backward_match"
                      @users = User.where("name LIKE?","%#{word}")
              elsif method == "perfect_match"
                      @users = User.where("name","#{word}")
              elsif method == "partial_match"
                      @users = User.where("name LIKE?","%#{word}%")
              else
                      @users = User.all
              end
    elsif type == "article_match"
              if method == "forward_match"
                      @articles = Article.where("title LIKE?","#{word}%")
              elsif method == "backward_match"
                      @articles = Article.where("title LIKE?","%#{word}")
              elsif method == "perfect_match"
                      @articles = Article.where("title","#{word}")
              elsif method == "partial_match"
                      @articles = Article.where("title LIKE?","%#{word}%")
              else
                      @articles = Article.all
              end
            end
  end
end
