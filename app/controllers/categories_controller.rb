class CategoriesController < ApplicationController

	def index
		ctx = Category::Index.call

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    json_response(ctx.categories, 200)
	end

	def create
		ctx = Category::Create.call(params: category_params.to_h)

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    json_response(ctx.category, 201)
	end
	
	def show
	end

	def destroy
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

end