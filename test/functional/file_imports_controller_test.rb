require 'test_helper'

class FileImportsControllerTest < ActionController::TestCase
  setup do
    @file_import = file_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_import" do
    assert_difference('FileImport.count') do
      post :create, file_import: {  }
    end

    assert_redirected_to file_import_path(assigns(:file_import))
  end

  test "should show file_import" do
    get :show, id: @file_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_import
    assert_response :success
  end

  test "should update file_import" do
    put :update, id: @file_import, file_import: {  }
    assert_redirected_to file_import_path(assigns(:file_import))
  end

  test "should destroy file_import" do
    assert_difference('FileImport.count', -1) do
      delete :destroy, id: @file_import
    end

    assert_redirected_to file_imports_path
  end
end
