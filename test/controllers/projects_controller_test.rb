require "test_helper"

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @request.headers['Accept'] = "application/json"
    @request.headers['Content-Type'] = "application/json"

    @project = Project.new(title: "My first app", description: "My first app description", see_code: "https://seecode.com", live_version: "https://liveversion.com")

    @project.images.attach(io: File.open('storage/images/life-style-articles-app.png'), filename: 'lifestylearticles.png', content_type: 'png')

    @project.save
  end

  test "should get index" do
    get :index, :format => "json"
    json_response = JSON.parse(response.body)
    
    assert_response :success    
    assert_equal json_response.first["title"], "My first app"
    assert_equal json_response.first["description"], "My first app description"
    assert_equal json_response.first["see_code"], "https://seecode.com"
    assert_equal json_response.first["live_version"], "https://liveversion.com"
  end

end
