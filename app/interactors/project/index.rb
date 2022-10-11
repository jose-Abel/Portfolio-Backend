class Project::Index
  include Interactor

  def call
    context.projects = query&.reorder(order)
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def query
    @projects = Project.all.with_attached_images
  end

  def order
    {
      created_at: :desc
    }
  end

  def handle_errors(message, status = 422)
    context.fail!(errors: message, status: status)
  end
end