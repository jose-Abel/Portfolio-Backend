class ProjectsController < ApplicationController
  include Response

  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /
  def index
    ctx = Project::Index.call

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    json_response(ctx.projects, 200)
  end

  # GET /1
  def show
  end

  # GET /new
  def new
    @project = Project.new
  end

  # GET /1/edit
  def edit
  end

  # POST /
  def create
    
  end

  # PATCH/PUT /1
  def update
    
  end

  # DELETE /1
  def destroy
    
  end

  private

end
