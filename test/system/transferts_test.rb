require "application_system_test_case"

class TransfertsTest < ApplicationSystemTestCase
  setup do
    @transfert = transferts(:one)
  end

  test "visiting the index" do
    visit transferts_url
    assert_selector "h1", text: "Transferts"
  end

  test "creating a Transfert" do
    visit transferts_url
    click_on "New Transfert"

    fill_in "Account", with: @transfert.account_id
    fill_in "Amount incl tax", with: @transfert.amount_incl_tax
    fill_in "Beneficiary city", with: @transfert.beneficiary_city
    fill_in "Beneficiary country", with: @transfert.beneficiary_country
    fill_in "Beneficiary first name", with: @transfert.beneficiary_first_name
    fill_in "Beneficiary gender", with: @transfert.beneficiary_gender
    fill_in "Beneficiary name", with: @transfert.beneficiary_name
    fill_in "Beneficiary phone", with: @transfert.beneficiary_phone
    fill_in "Currency", with: @transfert.currency_id
    fill_in "Mtcn", with: @transfert.mtcn
    fill_in "Reason", with: @transfert.reason
    fill_in "Sender city", with: @transfert.sender_city
    fill_in "Sender country", with: @transfert.sender_country
    fill_in "Sender first name", with: @transfert.sender_first_name
    fill_in "Sender gender", with: @transfert.sender_gender
    fill_in "Sender id type", with: @transfert.sender_id_type
    fill_in "Sender name", with: @transfert.sender_name
    fill_in "Sender phone", with: @transfert.sender_phone
    fill_in "Status", with: @transfert.status
    fill_in "Uid", with: @transfert.uid
    click_on "Create Transfert"

    assert_text "Transfert was successfully created"
    click_on "Back"
  end

  test "updating a Transfert" do
    visit transferts_url
    click_on "Edit", match: :first

    fill_in "Account", with: @transfert.account_id
    fill_in "Amount incl tax", with: @transfert.amount_incl_tax
    fill_in "Beneficiary city", with: @transfert.beneficiary_city
    fill_in "Beneficiary country", with: @transfert.beneficiary_country
    fill_in "Beneficiary first name", with: @transfert.beneficiary_first_name
    fill_in "Beneficiary gender", with: @transfert.beneficiary_gender
    fill_in "Beneficiary name", with: @transfert.beneficiary_name
    fill_in "Beneficiary phone", with: @transfert.beneficiary_phone
    fill_in "Currency", with: @transfert.currency_id
    fill_in "Mtcn", with: @transfert.mtcn
    fill_in "Reason", with: @transfert.reason
    fill_in "Sender city", with: @transfert.sender_city
    fill_in "Sender country", with: @transfert.sender_country
    fill_in "Sender first name", with: @transfert.sender_first_name
    fill_in "Sender gender", with: @transfert.sender_gender
    fill_in "Sender id type", with: @transfert.sender_id_type
    fill_in "Sender name", with: @transfert.sender_name
    fill_in "Sender phone", with: @transfert.sender_phone
    fill_in "Status", with: @transfert.status
    fill_in "Uid", with: @transfert.uid
    click_on "Update Transfert"

    assert_text "Transfert was successfully updated"
    click_on "Back"
  end

  test "destroying a Transfert" do
    visit transferts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transfert was successfully destroyed"
  end
end
