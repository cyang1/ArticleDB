class MarksController < ApplicationController
	def show
		@marks = Mark.for_article(params[:id])
		logger.info(@marks.to_json(:include => { :user => { :only => :first_name } }))
		render :json => @marks.to_json(:include => { :user => { :only => :first_name } })
	end

  def create
  	logger.info(params[:mark])
  	@mark = Mark.new(params[:mark])
  	@mark.user = current_user
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
