require 'test_helper'

class DescentClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @descent_client = descent_clients(:one)
  end

  test "should get index" do
    get descent_clients_url
    assert_response :success
  end

  test "should get new" do
    get new_descent_client_url
    assert_response :success
  end

  test "should create descent_client" do
    assert_difference('DescentClient.count') do
      post descent_clients_url, params: { descent_client: { boat_id: @descent_client.boat_id, client_id: @descent_client.client_id, enable_person_id: @descent_client.enable_person_id, fecha: @descent_client.fecha } }
    end

    assert_redirected_to descent_client_url(DescentClient.last)
  end

  test "should show descent_client" do
    get descent_client_url(@descent_client)
    assert_response :success
  end

  test "should get edit" do
    get edit_descent_client_url(@descent_client)
    assert_response :success
  end

  test "should update descent_client" do
    patch descent_client_url(@descent_client), params: { descent_client: { boat_id: @descent_client.boat_id, client_id: @descent_client.client_id, enable_person_id: @descent_client.enable_person_id, fecha: @descent_client.fecha } }
    assert_redirected_to descent_client_url(@descent_client)
  end

  test "should destroy descent_client" do
    assert_difference('DescentClient.count', -1) do
      delete descent_client_url(@descent_client)
    end

    assert_redirected_to descent_clients_url
  end
end
