class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new_user]

  # GET /new-user/1
  def new_user
    authorize_user
  end

  # GET /users
  # GET /users.json
  def index
    return if params[:search].length < 3
    unless params[:search].blank?
      @users = User.search(params[:search]).order("rating DESC")
    else
      if can?(:index, :users)
        @users = User.all.order("rating DESC")
      else
        @users = []
      end
    end
  end

  def current_user_home
    redirect_to "/users/#{current_user.slug}"
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @endorsements  = @user.endorsements
    @followers     = @user.followers
    @relationship  = @user.follower_relationships.where(follower: current_user).first
    @skill_ratings = @user.skill_ratings
    @sr_labels     = @user.skill_labels
    @sr_values     = @user.skill_values
    @achievements  = @user.achievements
    if @user == current_user
      @notes = @user.notes.order('created_at DESC')
    else
      @notes = @user.notes.where.not(is_private: true).order('created_at DESC')
    end
  end
  
  def feed
    params[:page].present? ? set_page : @page = 1
    @notes = Note.paged(@page, current_user)
  end

  def set_page
    @page = (params[:page].to_i.negative? || params[:page].to_i.zero?) ? 1 : params[:page].to_i
    @page = Note.num_pages(current_user) if @page > Note.num_pages(current_user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :role)
    end
    
    def page_params
      params.permit(:page)
    end

    def authorize_user
      raise ActionController::RoutingError.new('Not Found') unless (params[:id] == current_user.id.to_s || params[:id] == current_user.slug)
    end
end
