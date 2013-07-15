class CollaborationsController < ApplicationController
  before_filter :check_current_user

  def index
    @collabs = current_user.collaborations
  end

  def new
    @collab = Collaboration.new
  end

  def create
    p params
    @collab = Collaboration.new(params[:collaboration])
    if @collab.save
      UserCollaboration.create!(:collaboration_id => @collab.id, :user_id => current_user.id)
      if params[:users_list] != nil
        params[:users_list].each do |u|
          user_id = User.find_by_email(u).id
          UserCollaboration.create!(:collaboration_id => @collab.id, :user_id => user_id)
        end
      end
      render :text => collaboration_path(@collab)
  
    else
      logger.info("FAILED VALIDATION")
      logger.info(@articles.errors)
    end
  end

  def show
    @collab = Collaboration.find(params[:id])
    respond_to do |format|
      if @collab.user_collaborations.exists?(:user_id => current_user.id)
        @articles = @collab.articles.order(:id)
        format.html
        format.json { render :json => @articles }
      else
        format.html { redirect_to collaborations_path }
        format.json { head :forbidden }
      end
    end
  end

  def edit
    @collab = Collaboration.find(params[:id])
    respond_to do |format|
      if collab.user_collaborations.exists?(:user_id => current_user.id)
        format.html
        format.json { render :json => @articles }
      else
        format.html { redirect_to collaborations_path }
        format.json { head :forbidden }
      end
    end
  end

  private

  def check_current_user
    redirect_to '/login' if current_user.nil?
  end
end
