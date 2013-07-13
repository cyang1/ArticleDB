class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to new_article_path
  	else
  		redirect_to "new"
  	end
  end

  def typeahead
    users = User.where('lower(email) LIKE :prefix OR (lower(first_name) || " " || lower(last_name)) LIKE :prefix', :prefix => "%#{params[:query].downcase}%").select('email as username, (first_name || " " || last_name) as name')
    render :json => { :options => users }
  end
end