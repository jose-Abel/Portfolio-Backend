class ProjectsController < ApplicationController
  include Response

  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    ctx = Project::Index.call

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    json_response(ctx.projects, 200)
  end

  def create
    ctx = Project::Create.call(params: create_params.to_h)

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    json_response(ctx.project, 201)
  end

  def show
  end

  def update
    
  end

  def destroy
    
  end

  private

  def create_params
		params.require(:project).permit(:title, :description, :see_code, :live_version, images: [])
	end

end
