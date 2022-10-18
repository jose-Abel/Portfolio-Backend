require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = Category.create(name: "HTML")
  end

  setup do
    @request.headers['Accept'] = "application/json"
    @request.headers['Content-Type'] = "application/json"

    @category = Category.create(name: "HTML")
  end

  test "should get index" do
    get :index, :format => "json"
    json_response = JSON.parse(response.body)
    
    assert_response :success    
    assert_equal json_response.first["name"], "HTML"
  end

end
