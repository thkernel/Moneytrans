require "application_system_test_case"

class WithdrawalsTest < ApplicationSystemTestCase
  setup do
    @withdrawal = withdrawals(:one)
  end

  test "visiting the index" do
    visit withdrawals_url
    assert_selector "h1", text: "Withdrawals"
  end

  test "creating a Withdrawal" do
    visit withdrawals_url
    click_on "New Withdrawal"

    fill_in "Account", with: @withdrawal.account_id
    fill_in "Amount incl tax", with: @withdrawal.amount_incl_tax
    fill_in "Beneficiary identity document code", with: @withdrawal.beneficiary_identity_document_code
    fill_in "Beneficiary identity document type", with: @withdrawal.beneficiary_identity_document_type_id
    fill_in "Status", with: @withdrawal.status
    fill_in "Transfert", with: @withdrawal.transfert_id
    fill_in "Uid", with: @withdrawal.uid
    click_on "Create Withdrawal"

    assert_text "Withdrawal was successfully created"
    click_on "Back"
  end

  test "updating a Withdrawal" do
    visit withdrawals_url
    click_on "Edit", match: :first

    fill_in "Account", with: @withdrawal.account_id
    fill_in "Amount incl tax", with: @withdrawal.amount_incl_tax
    fill_in "Beneficiary identity document code", with: @withdrawal.beneficiary_identity_document_code
    fill_in "Beneficiary identity document type", with: @withdrawal.beneficiary_identity_document_type_id
    fill_in "Status", with: @withdrawal.status
    fill_in "Transfert", with: @withdrawal.transfert_id
    fill_in "Uid", with: @withdrawal.uid
    click_on "Update Withdrawal"

    assert_text "Withdrawal was successfully updated"
    click_on "Back"
  end

  test "destroying a Withdrawal" do
    visit withdrawals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Withdrawal was successfully destroyed"
  end
end
