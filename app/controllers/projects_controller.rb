class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_time_entries, only: [:show]


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @projects.each do |project|
      worked_hours = 0
      @time_entries = TimeEntry.where(Project_id: project.id)
      @time_entries.each do |entry|
        worked_hours += entry.number_of_hours
      end
      project.update_attribute(:worked_hours, worked_hours)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_time_entries
      if @project
        @time_entries = TimeEntry.where(Project_id: @project.id)
        hours_worked = 0
        @time_entries.each do |entry|
            hours_worked += entry.number_of_hours
        end
        @project.update_attribute(:worked_hours, hours_worked)
      end

    end
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :total_hours_to_finish, :worked_hours, :User_id)
    end
end
