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

  test "should get all categories" do
    get :index, :format => "json"
    json_response = JSON.parse(response.body)
    
    assert_response :success    
    assert_equal json_response.first["name"], "HTML"
  end

  test "should create a new category" do
    post :create, format: :json, params: { category: {name: "CSS" }}

    json_response = JSON.parse(response.body)

    assert_response :success    
    assert_equal json_response["name"], "CSS"
  end

  test "should not create a new category if not admin" do
    post :create, format: :json, params: { category: {name: "CSS" }}
    byebug
    assert_response  
    assert_no_difference("Category.count")
  end

end
