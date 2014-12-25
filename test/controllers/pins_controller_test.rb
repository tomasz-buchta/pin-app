require 'test_helper'

class PinsControllerTest < ActionController::TestCase

  # include Nester::TestCase
  # nest :pin, under: [:board]

  setup do
    @pin = pins(:one)
  end

  test "should get index" do
    get :index, board_id: @pin.board.id
    assert_response :success
    assert_not_nil assigns(:pins)
  end

    test "should get index with friendly_id" do
    get :index, board_id: @pin.board.slug
    assert_response :success
    assert_not_nil assigns(:pins)
  end

  test "should get new" do
    get :new,board_id: @pin.board.id
    assert_response :success
  end

  test "should create pin" do
    assert_difference('Pin.count') do
      post :create,board_id: @pin.board.slug, pin: { board_id: @pin.board_id, image: @pin.image, name: @pin.name }
    end

    assert_redirected_to board_pin_path(@pin.board.slug,assigns(:pin))
  end

  test "should show pin" do
    get :show, id: @pin,board_id: @pin.board.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pin,board_id: @pin.board.id
    assert_response :success
  end

  test "should update pin" do
    patch :update, id: @pin,board_id: @pin.board.id, pin: { board_id: @pin.board_id, image: @pin.image, name: @pin.name }
    assert_redirected_to board_pin_url(@pin.board.slug,@pin.slug)
  end

  test "should destroy pin" do
    assert_difference('Pin.count', -1) do
      delete :destroy, id: @pin.slug,board_id: @pin.board.slug
    end

    assert_redirected_to board_pins_url(@pin.board.slug)
  end
end
