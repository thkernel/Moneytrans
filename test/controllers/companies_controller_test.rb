require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { account_id: @company.account_id, address: @company.address, city: @company.city, email: @company.email, name: @company.name, phone: @company.phone, po_box: @company.po_box, postal_code: @company.postal_code, social_reason: @company.social_reason, uid: @company.uid } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { account_id: @company.account_id, address: @company.address, city: @company.city, email: @company.email, name: @company.name, phone: @company.phone, po_box: @company.po_box, postal_code: @company.postal_code, social_reason: @company.social_reason, uid: @company.uid } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
