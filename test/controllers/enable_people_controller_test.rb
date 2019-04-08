require 'test_helper'

class EnablePeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enable_person = enable_people(:one)
  end

  test "should get index" do
    get enable_people_url
    assert_response :success
  end

  test "should get new" do
    get new_enable_person_url
    assert_response :success
  end

  test "should create enable_person" do
    assert_difference('EnablePerson.count') do
      post enable_people_url, params: { enable_person: { apellido: @enable_person.apellido, client_id: @enable_person.client_id, dni: @enable_person.dni, estado: @enable_person.estado, nombre: @enable_person.nombre } }
    end

    assert_redirected_to enable_person_url(EnablePerson.last)
  end

  test "should show enable_person" do
    get enable_person_url(@enable_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_enable_person_url(@enable_person)
    assert_response :success
  end

  test "should update enable_person" do
    patch enable_person_url(@enable_person), params: { enable_person: { apellido: @enable_person.apellido, client_id: @enable_person.client_id, dni: @enable_person.dni, estado: @enable_person.estado, nombre: @enable_person.nombre } }
    assert_redirected_to enable_person_url(@enable_person)
  end

  test "should destroy enable_person" do
    assert_difference('EnablePerson.count', -1) do
      delete enable_person_url(@enable_person)
    end

    assert_redirected_to enable_people_url
  end
end
