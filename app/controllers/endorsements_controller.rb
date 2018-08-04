class EndorsementsController < ApplicationController
  before_action :set_endorsement, only: [:show, :edit, :update, :destroy]

  # GET /endorsements
  # GET /endorsements.json
  def index
    can?(:manage, :endorsements) ? @endorsements = Endorsement.all : @endorsements = Endorsement.where(endorsee_id: current_user.id)
  end

  # GET /endorsements/1
  # GET /endorsements/1.json
  def show
    not_found unless can?(:read, Endorsement.find(params[:id]))
  end

  # GET /endorsements/new
  def new
    @endorsement = Endorsement.new
    @skills = Skill.all.map(&:name)
  end

  # GET /endorsements/1/edit
  def edit
  end

  # POST /endorsements
  # POST /endorsements.json
  def create
    if params[:ajax]
      create_by_ajax
    else
      error = nil
      begin
        @endorsement = Endorsement.create(
            :endorser_id => current_user.id,
            :endorsee_id => User.find_by(:email => params[:endorsement][:email])&.id,
            :skill_id => Skill.find_by(:name => params[:endorsement][:skill])&.id
        )
      rescue => e
        error = 'An error occurred. Please try again.'
      end

      respond_to do |format|
        if error.blank?
          format.html { redirect_to root_path }
          format.json { render :show, status: :created, location: @endorsement }
        else
          format.html { redirect_to new_endorsement_path, alert: error }
          format.json { render json: @endorsement.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def create_by_ajax
    @endorsement = Endorsement.create(
      skill_id: params[:skill_id],
      note_id: params[:note_id],
      endorser_id: params[:endorser_id],
      endorsee_id: params[:endorsee_id]
    )
    @skill = Skill.find(@endorsement.skill_id)
    @note = @endorsement.note
    @endorsement_count = @note.user_endorsements.where(skill: @skill).count
    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.html { redirect_to Note.find(note_id) }
    end
  end

  # PATCH/PUT /endorsements/1
  # PATCH/PUT /endorsements/1.json
  def update
    respond_to do |format|
      if @endorsement.update(endorsement_params)
        format.html { redirect_to @endorsement }
        format.json { render :show, status: :ok, location: @endorsement }
      else
        format.html { render :edit }
        format.json { render json: @endorsement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endorsements/1
  # DELETE /endorsements/1.json
  def destroy
    @skill = Skill.find(@endorsement.skill_id)
    @note = @endorsement.note
    @endorsement_count = @note.user_endorsements.where(skill: @skill).count - 1
    @endorsement.destroy
    
    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.html { redirect_to endorsements_url }
      format.json { head :no_content }
    end
  end

  private

    def set_endorsement
      @endorsement = Endorsement.find(params[:id])
    end

    def endorsement_params
      params.require(:endorsement).permit(:email, :skill)
    end
end
