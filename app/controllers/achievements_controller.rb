class AchievementsController < ApplicationController
  before_action :set_achievement, only: [:edit, :update, :destroy, :grant]
  before_action :verify_user

  # GET /achievements
  # GET /achievements.json
  def index
    @achievements = Achievement.all
  end

  # GET /achievements/new
  def new
    @achievement = Achievement.new
  end

  # GET /achievements/1/edit
  def edit
  end

  # POST /achievements
  # POST /achievements.json
  def create
    @achievement = Achievement.new(achievement_params)

    respond_to do |format|
      if @achievement.save
        format.html { rendirect_to achievements_url, notice: 'Achievement successfully saved.' }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      else
        format.html { render :new }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievements/1
  # PATCH/PUT /achievements/1.json
  def update
    granted = add_users

    respond_to do |format|
      if @achievement.update(achievement_params)
        format.html { redirect_to achievements_url, notice: "Achievement successfully #{granted ? 'granted.' : 'updated.'}" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      else
        format.html { render :edit }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievement.destroy
    respond_to do |format|
      format.html { redirect_to achievements_url, notice: 'Achievement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def grant
    @built_user = @achievement.users.build
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      return @achievement = Achievement.find(params[:achievement_id]) if params[:achievement_id]
      @achievement = Achievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_params
      params.fetch(:achievement, {})
    end

    def built_user_params
      params.require(:user).permit(id: [])
    end

    def add_users
      granted = false
      built_user_params[:id].each do |user_id|
        unless user_id.empty?
          u = User.find_by(id: user_id)
          if u.achievements.include? @achievement
            @achievement.users.delete(u)
          else
            @achievement.users << u
            granted = true
          end
        end
      end
      return granted
    end

    def verify_user
      raise ActionController::RoutingError.new('Not Found') unless current_user&.administrator?
    end
end
