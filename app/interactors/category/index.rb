class Category::Index
  include Interactor

  def call
    context.categories = query&.reorder(order)
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def query
    @categories = Category.all
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