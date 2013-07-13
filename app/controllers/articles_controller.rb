class ArticlesController < ApplicationController
  
  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(params[:article])
  	if @article.save!
  		redirect_to articles_path(@article)
  	else
  		logger.info("FAILED VALIDATION")
  		logger.info(@articles.errors)
  	end
  end

  def show
  	@article = Article.find(params[:id])
  	render :layout => "pdf"
  end

  def update
	  @article = Article.find(params[:id])
	  respond_to do |format|
	    if @article.update_attributes(params[:article])
	      format.html { redirect_to @article, notice: 'Article was successfully updated.' }
	      format.json { head :no_content } # 204 No Content
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @article.errors, status: :unprocessable_entity }
	    end
	  end
	end

end
