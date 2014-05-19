class HomeTeachersController < ApplicationController
  before_action :set_home_teacher, only: [:show, :edit, :update, :destroy, :vote]

  # GET /home_teachers
  # GET /home_teachers.json
  def index
    @home_teachers = HomeTeacher.all
  end

  # GET /home_teachers/1
  # GET /home_teachers/1.json
  def show
  end

  # GET /home_teachers/new
  def new
    @home_teacher = HomeTeacher.new
  end

  # GET /home_teachers/1/edit
  def edit
  end

  # POST /home_teachers
  # POST /home_teachers.json
  def create
    @home_teacher = HomeTeacher.new(home_teacher_params)

    respond_to do |format|
      if @home_teacher.save
        format.html { redirect_to @home_teacher, notice: 'Home teacher was successfully created.' }
        format.json { render action: 'show', status: :created, location: @home_teacher }
      else
        format.html { render action: 'new' }
        format.json { render json: @home_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_teachers/1
  # PATCH/PUT /home_teachers/1.json
  def update
    respond_to do |format|
      if @home_teacher.update(home_teacher_params)
        format.html { redirect_to @home_teacher, notice: 'Home teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @home_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_teachers/1
  # DELETE /home_teachers/1.json
  def destroy
    @home_teacher.destroy
    respond_to do |format|
      format.html { redirect_to home_teachers_url }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @home_teacher.vote voter: current_user, vote: direction

    redirect_to index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_teacher
      @home_teacher = HomeTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_teacher_params
      params.require(:home_teacher).permit(:name)
    end
end
