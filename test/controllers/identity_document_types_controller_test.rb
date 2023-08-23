require "test_helper"

class IdentityDocumentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @identity_document_type = identity_document_types(:one)
  end

  test "should get index" do
    get identity_document_types_url
    assert_response :success
  end

  test "should get new" do
    get new_identity_document_type_url
    assert_response :success
  end

  test "should create identity_document_type" do
    assert_difference('IdentityDocumentType.count') do
      post identity_document_types_url, params: { identity_document_type: { account_id: @identity_document_type.account_id, description: @identity_document_type.description, name: @identity_document_type.name, status: @identity_document_type.status, uid: @identity_document_type.uid } }
    end

    assert_redirected_to identity_document_type_url(IdentityDocumentType.last)
  end

  test "should show identity_document_type" do
    get identity_document_type_url(@identity_document_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_identity_document_type_url(@identity_document_type)
    assert_response :success
  end

  test "should update identity_document_type" do
    patch identity_document_type_url(@identity_document_type), params: { identity_document_type: { account_id: @identity_document_type.account_id, description: @identity_document_type.description, name: @identity_document_type.name, status: @identity_document_type.status, uid: @identity_document_type.uid } }
    assert_redirected_to identity_document_type_url(@identity_document_type)
  end

  test "should destroy identity_document_type" do
    assert_difference('IdentityDocumentType.count', -1) do
      delete identity_document_type_url(@identity_document_type)
    end

    assert_redirected_to identity_document_types_url
  end
end
