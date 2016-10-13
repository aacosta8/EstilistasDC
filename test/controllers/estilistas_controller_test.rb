require 'test_helper'

class EstilistasControllerTest < ActionDispatch::IntegrationTest
  test "should get inicioest" do
    get estilistas_inicioest_url
    assert_response :success
  end

end
