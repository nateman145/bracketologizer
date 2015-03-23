require 'test_helper'

class BracketNodesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bracket_nodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bracket_node" do
    assert_difference('BracketNode.count') do
      post :create, :bracket_node => { }
    end

    assert_redirected_to bracket_node_path(assigns(:bracket_node))
  end

  test "should show bracket_node" do
    get :show, :id => bracket_nodes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bracket_nodes(:one).to_param
    assert_response :success
  end

  test "should update bracket_node" do
    put :update, :id => bracket_nodes(:one).to_param, :bracket_node => { }
    assert_redirected_to bracket_node_path(assigns(:bracket_node))
  end

  test "should destroy bracket_node" do
    assert_difference('BracketNode.count', -1) do
      delete :destroy, :id => bracket_nodes(:one).to_param
    end

    assert_redirected_to bracket_nodes_path
  end
end
