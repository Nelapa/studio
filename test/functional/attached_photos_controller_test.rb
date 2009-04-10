require 'test_helper'

class AttachedPhotosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attached_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attached_photo" do
    assert_difference('AttachedPhoto.count') do
      post :create, :attached_photo => { }
    end

    assert_redirected_to attached_photo_path(assigns(:attached_photo))
  end

  test "should show attached_photo" do
    get :show, :id => attached_photos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => attached_photos(:one).to_param
    assert_response :success
  end

  test "should update attached_photo" do
    put :update, :id => attached_photos(:one).to_param, :attached_photo => { }
    assert_redirected_to attached_photo_path(assigns(:attached_photo))
  end

  test "should destroy attached_photo" do
    assert_difference('AttachedPhoto.count', -1) do
      delete :destroy, :id => attached_photos(:one).to_param
    end

    assert_redirected_to attached_photos_path
  end
end
