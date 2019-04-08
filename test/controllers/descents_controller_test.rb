require 'test_helper'

class DescentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @descent = descents(:one)
  end

  test "should get index" do
    get descents_url
    assert_response :success
  end

  test "should get new" do
    get new_descent_url
    assert_response :success
  end

  test "should create descent" do
    assert_difference('Descent.count') do
      post descents_url, params: { descent: { apellido: @descent.apellido, dni: @descent.dni, fecha: @descent.fecha, matricula_bote: @descent.matricula_bote, motor_bote: @descent.motor_bote, nombre: @descent.nombre, nombre_bote: @descent.nombre_bote } }
    end

    assert_redirected_to descent_url(Descent.last)
  end

  test "should show descent" do
    get descent_url(@descent)
    assert_response :success
  end

  test "should get edit" do
    get edit_descent_url(@descent)
    assert_response :success
  end

  test "should update descent" do
    patch descent_url(@descent), params: { descent: { apellido: @descent.apellido, dni: @descent.dni, fecha: @descent.fecha, matricula_bote: @descent.matricula_bote, motor_bote: @descent.motor_bote, nombre: @descent.nombre, nombre_bote: @descent.nombre_bote } }
    assert_redirected_to descent_url(@descent)
  end

  test "should destroy descent" do
    assert_difference('Descent.count', -1) do
      delete descent_url(@descent)
    end

    assert_redirected_to descents_url
  end
end
