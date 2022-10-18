class Category::Create
  include Interactor

	before do
		context.category_params ||= context.params
	end

  def call
		return if context.category_params.blank?

		ActiveRecord::Base.transaction do
			context.category = Category.create!(context.category_params)
		end
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def handle_errors(message, status = 422)
    context.fail!(errors: message, status: status)
  end
end