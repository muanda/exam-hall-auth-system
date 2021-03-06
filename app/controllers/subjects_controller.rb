class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :set_student, only: [:new,:create,:edit, :update, :destroy,:show]
  # before_action :require_user, except: [:index,:view]
  # before_action :require_same_student, only: [:edit,:update,:show,:destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
    session[:setting] = ""
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = @student.subject.find(params[:id])
    session[:setting] = ""
  end

  # GET /subjects/new
  def new
    @subject = @student.subject.build
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    session[:setting] = ""
    @subject = @student.subject.create(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to  student_path(@student), notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    session[:setting] = ""
    @subject = @student.subject.find(params[:id])
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to student_path(@student), notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    session[:setting] = ""
    @subject = @student.subject.find(params[:id])
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:student_id])
    end

    # def require_student
    # @subject = @student.subject.find(params[:id])
    # if current_user != @subject.student
    #   flash[:denger] = 'you can only edit or delete your recipe'
    #   redirect_to root_path
    # end
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :code, :final_Mark, :exam_datetime, :exam_venue, :student_id, )
    end
end
