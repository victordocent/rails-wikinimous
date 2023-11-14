class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create # POST /Articles
    @article = Article.new(set_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(set_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy # DELETE /Articles/:id
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def set_params
    params.require(:Article).permit(:title, :content)
  end

end
