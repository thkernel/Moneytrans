require "test_helper"

class TransferReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfer_reason = transfer_reasons(:one)
  end

  test "should get index" do
    get transfer_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_transfer_reason_url
    assert_response :success
  end

  test "should create transfer_reason" do
    assert_difference('TransferReason.count') do
      post transfer_reasons_url, params: { transfer_reason: { account_id: @transfer_reason.account_id, description: @transfer_reason.description, name: @transfer_reason.name, status: @transfer_reason.status, uid: @transfer_reason.uid } }
    end

    assert_redirected_to transfer_reason_url(TransferReason.last)
  end

  test "should show transfer_reason" do
    get transfer_reason_url(@transfer_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_transfer_reason_url(@transfer_reason)
    assert_response :success
  end

  test "should update transfer_reason" do
    patch transfer_reason_url(@transfer_reason), params: { transfer_reason: { account_id: @transfer_reason.account_id, description: @transfer_reason.description, name: @transfer_reason.name, status: @transfer_reason.status, uid: @transfer_reason.uid } }
    assert_redirected_to transfer_reason_url(@transfer_reason)
  end

  test "should destroy transfer_reason" do
    assert_difference('TransferReason.count', -1) do
      delete transfer_reason_url(@transfer_reason)
    end

    assert_redirected_to transfer_reasons_url
  end
end
