class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @categories = Category.all
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @categories = Category.all
  end

  # GET /articles/new
  def new
    @categories = Category.all
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @categories = Category.all
  end

  # POST /articles or /articles.json
  def create
    @categories = Category.all
    @article = Article.new(article_params)
    @users = User.all
    @article.author = @users.first
      if @article.save
        flash[:success] = "Article was successfully created."
        redirect_to @article
      else
        flash[:danger] = @article.errors
        render :new
      end

  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :text, :image, :category_id)
    end
end
