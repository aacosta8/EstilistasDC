require 'test_helper'

class ClientesControllerTest < ActionDispatch::IntegrationTest
  test "should get iniciocli" do
    get clientes_iniciocli_url
    assert_response :success
  end

end
