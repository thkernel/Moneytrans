require "application_system_test_case"

class TransferReasonsTest < ApplicationSystemTestCase
  setup do
    @transfer_reason = transfer_reasons(:one)
  end

  test "visiting the index" do
    visit transfer_reasons_url
    assert_selector "h1", text: "Transfer Reasons"
  end

  test "creating a Transfer reason" do
    visit transfer_reasons_url
    click_on "New Transfer Reason"

    fill_in "Account", with: @transfer_reason.account_id
    fill_in "Description", with: @transfer_reason.description
    fill_in "Name", with: @transfer_reason.name
    fill_in "Status", with: @transfer_reason.status
    fill_in "Uid", with: @transfer_reason.uid
    click_on "Create Transfer reason"

    assert_text "Transfer reason was successfully created"
    click_on "Back"
  end

  test "updating a Transfer reason" do
    visit transfer_reasons_url
    click_on "Edit", match: :first

    fill_in "Account", with: @transfer_reason.account_id
    fill_in "Description", with: @transfer_reason.description
    fill_in "Name", with: @transfer_reason.name
    fill_in "Status", with: @transfer_reason.status
    fill_in "Uid", with: @transfer_reason.uid
    click_on "Update Transfer reason"

    assert_text "Transfer reason was successfully updated"
    click_on "Back"
  end

  test "destroying a Transfer reason" do
    visit transfer_reasons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transfer reason was successfully destroyed"
  end
end
