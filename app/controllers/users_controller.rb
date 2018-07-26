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
    @endorsers     = @user.endorsers.map(&:endorser).flatten.compact
    @endorsees     = @user.endorsees.map(&:endorsee).flatten.compact
    @skill_ratings = @user.skill_ratings
    @sr_labels     = @user.skill_labels
    @sr_values     = @user.skill_values
    @notes         = @user.notes.order('created_at DESC')
    @achievements  = @user.achievements
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

    def authorize_user
      raise ActionController::RoutingError.new('Not Found') unless (params[:id] == current_user.id.to_s || params[:id] == current_user.slug)
    end
end
