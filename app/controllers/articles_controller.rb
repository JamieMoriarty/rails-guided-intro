class ArticlesController < ApplicationController

  # By convention, this displays the 'view' located at "app/views/articles/index"
  def index
    @articles = Article.all
  end

  # By convention, this displays the 'view' located at "app/views/articles/show"
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    # 'redirect_to' means the browser makes a new request, with 'render' the view is rendered for current request
    # Be careful with 'render' and non-idempotentn requests!
    if @article.save
      redirect_to @article
    else
      # Here ':new' refers to the 'new' method of the present class
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      # Here ':edit' refers to the 'new' method of the present class
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private 
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
