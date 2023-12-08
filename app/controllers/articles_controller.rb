class ArticlesController < ApplicationController
  def show
    # abort params.inspect
    @article = Article.find(1)
  end
end
