require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = User.create(email: "test@email.com", password: "testing")
    
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
    sign_in(@user)
    post :create, format: :json, params: { category: {name: "CSS" }}

    json_response = JSON.parse(response.body)

    assert_response :success    
    assert_equal json_response["name"], "CSS"
  end

  test "should not create a new category if not sign in" do
    post :create, format: :json, params: { category: {name: "CSS" }}
    json_response = JSON.parse(response.body)

    assert_response 401
    assert_equal json_response["error"], "You need to sign in or sign up before continuing."
  end

end
