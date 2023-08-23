require "test_helper"

class TransfertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfert = transferts(:one)
  end

  test "should get index" do
    get transferts_url
    assert_response :success
  end

  test "should get new" do
    get new_transfert_url
    assert_response :success
  end

  test "should create transfert" do
    assert_difference('Transfert.count') do
      post transferts_url, params: { transfert: { account_id: @transfert.account_id, amount_incl_tax: @transfert.amount_incl_tax, beneficiary_city: @transfert.beneficiary_city, beneficiary_country: @transfert.beneficiary_country, beneficiary_first_name: @transfert.beneficiary_first_name, beneficiary_gender: @transfert.beneficiary_gender, beneficiary_name: @transfert.beneficiary_name, beneficiary_phone: @transfert.beneficiary_phone, currency_id: @transfert.currency_id, mtcn: @transfert.mtcn, reason: @transfert.reason, sender_city: @transfert.sender_city, sender_country: @transfert.sender_country, sender_first_name: @transfert.sender_first_name, sender_gender: @transfert.sender_gender, sender_id_type: @transfert.sender_id_type, sender_name: @transfert.sender_name, sender_phone: @transfert.sender_phone, status: @transfert.status, uid: @transfert.uid } }
    end

    assert_redirected_to transfert_url(Transfert.last)
  end

  test "should show transfert" do
    get transfert_url(@transfert)
    assert_response :success
  end

  test "should get edit" do
    get edit_transfert_url(@transfert)
    assert_response :success
  end

  test "should update transfert" do
    patch transfert_url(@transfert), params: { transfert: { account_id: @transfert.account_id, amount_incl_tax: @transfert.amount_incl_tax, beneficiary_city: @transfert.beneficiary_city, beneficiary_country: @transfert.beneficiary_country, beneficiary_first_name: @transfert.beneficiary_first_name, beneficiary_gender: @transfert.beneficiary_gender, beneficiary_name: @transfert.beneficiary_name, beneficiary_phone: @transfert.beneficiary_phone, currency_id: @transfert.currency_id, mtcn: @transfert.mtcn, reason: @transfert.reason, sender_city: @transfert.sender_city, sender_country: @transfert.sender_country, sender_first_name: @transfert.sender_first_name, sender_gender: @transfert.sender_gender, sender_id_type: @transfert.sender_id_type, sender_name: @transfert.sender_name, sender_phone: @transfert.sender_phone, status: @transfert.status, uid: @transfert.uid } }
    assert_redirected_to transfert_url(@transfert)
  end

  test "should destroy transfert" do
    assert_difference('Transfert.count', -1) do
      delete transfert_url(@transfert)
    end

    assert_redirected_to transferts_url
  end
end
