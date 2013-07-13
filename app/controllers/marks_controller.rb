class MarksController < ApplicationController
	def show
		@marks = Mark.for_article(params[:id])
		render :json => @marks
	end

  def create
  	logger.info(params[:mark])
  	@mark = Mark.new(params[:mark])
  	if @mark.save
  		render :json => { 
	      :status => :ok, 
	      :message => "Success!",
	      :html => "...insert html..."
	    }.to_json
	  else
	  	render :json => {
	  		:status => :unprocessable_entity,
	  		:message => @mark.errors.full_messages
	  	}.to_json
	  end
  end
end
