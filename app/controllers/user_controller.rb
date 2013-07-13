class UserController < ApplicationController
  def create

  end

  def typeahead
    users = User.where('lower(email) LIKE :prefix OR (lower(first_name) || " " || lower(last_name)) LIKE :prefix', :prefix => "%#{params[:query].downcase}%").select('email as username, (first_name || " " || last_name) as name')
    render :json => { :options => users }
  end
end