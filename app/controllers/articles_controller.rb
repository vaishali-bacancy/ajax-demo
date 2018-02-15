class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @article = Article.new
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit

  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      @article = Article.new
      @articles = Article.all
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      @article = Article.new
      @articles = Article.all
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.destroy
      @article = Article.new
      @articles = Article.all
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
