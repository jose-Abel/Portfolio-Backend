class Project::Create
  include Interactor

	before do
		context.project_params ||= context.params
	end

  def call
		return if context.project_params.blank?

		ActiveRecord::Base.transaction do
			context.project = Project.create!(context.project_params)
		end
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def handle_errors(message, status = 422)
    context.fail!(errors: message, status: status)
  end
end