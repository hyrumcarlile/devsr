class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  def new_import
    @note = Note.new
  end

  def import
    begin
      Note.sanitize_html(Note.import(params[:note][:import_file], current_user)).save
      redirect_to current_user
    rescue => exception
      redirect_to import_new_path, locals: exception
      end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    raise ActionController::RoutingError.new('Not Found') if (@note.is_private && @note.user != current_user)
    @endorsements = @note.sort_endorsements
    @buttons_visible = !current_user.blank?
    @upvote_btn = @note.should_show_upvote_btn(current_user)
    @vote = Vote.find_by(user_id: current_user.id, note_id: @note.id) unless current_user.blank?
  end

  # GET /notes/new
  def new
    @note = Note.new
    @skills = Skill.all.map(&:name)
  end

  # GET /notes/1/edit
  def edit
    @skills = Skill.all.map(&:name)
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    create_skills

    respond_to do |format|
      if @note.save
        format.html { redirect_to current_user }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    create_skills

    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  def upvote
    @note = Note.friendly.find(params[:note_id])
    Vote.create(note_id: @note.id, is_upvote?: true, user_id: current_user.id)
    redirect_to @note
  end

  private

  def create_skills
    skill_names = params[:note][:skills].split(',')
    return if skill_names == @note.skills.map(&:name) || skill_names.blank?
    @note.noteskills.destroy_all
    skill_names.each do |skill_name|
      ::Noteskill.create(note: @note, skill: Skill.find_by(name: skill_name))
    end
  end

  def set_note
    @note = Note.friendly.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body, :title, :subtitle, :image_url, :comments_disabled, :is_private)
  end
end
