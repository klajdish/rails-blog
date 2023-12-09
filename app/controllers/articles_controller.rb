class ArticlesController < ApplicationController
  def show
    # render plain: params;
    # abort params.inspect
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @test = '123'

    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id]);
  end

  def update
    @article = Article.find(params[:id])
    result = @article.update(params.require(:article).permit(:title, :description));

    if result
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
