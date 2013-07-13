class ArticlesController < ApplicationController
  
  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(params[:article])
  	if @article.save!
  		redirect_to new_article_path
  	else
  		logger.info("FAILED VALIDATION")
  		logger.info(@articles.errors)
  	end
  end

end
