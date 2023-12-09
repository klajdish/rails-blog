class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def show
    # render plain: params;
    # abort params.inspect
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @test = '123'

    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    result = @article.update(article_params)

    if result
      flash[:notice] = "Updated Succesfully"
      redirect_to articles_path
    else
      flash[:notice] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Deleted Succesfully"
    else
      flash[:notice] = "Something went wrong"
    end
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
