require 'test_helper'

class EnabledClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enabled_client = enabled_clients(:one)
  end

  test "should get index" do
    get enabled_clients_url
    assert_response :success
  end

  test "should get new" do
    get new_enabled_client_url
    assert_response :success
  end

  test "should create enabled_client" do
    assert_difference('EnabledClient.count') do
      post enabled_clients_url, params: { enabled_client: { clients_id: @enabled_client.clients_id, descripcion: @enabled_client.descripcion, enabled_person_id: @enabled_client.enabled_person_id } }
    end

    assert_redirected_to enabled_client_url(EnabledClient.last)
  end

  test "should show enabled_client" do
    get enabled_client_url(@enabled_client)
    assert_response :success
  end

  test "should get edit" do
    get edit_enabled_client_url(@enabled_client)
    assert_response :success
  end

  test "should update enabled_client" do
    patch enabled_client_url(@enabled_client), params: { enabled_client: { clients_id: @enabled_client.clients_id, descripcion: @enabled_client.descripcion, enabled_person_id: @enabled_client.enabled_person_id } }
    assert_redirected_to enabled_client_url(@enabled_client)
  end

  test "should destroy enabled_client" do
    assert_difference('EnabledClient.count', -1) do
      delete enabled_client_url(@enabled_client)
    end

    assert_redirected_to enabled_clients_url
  end
end
