require "application_system_test_case"

class IdentityDocumentTypesTest < ApplicationSystemTestCase
  setup do
    @identity_document_type = identity_document_types(:one)
  end

  test "visiting the index" do
    visit identity_document_types_url
    assert_selector "h1", text: "Identity Document Types"
  end

  test "creating a Identity document type" do
    visit identity_document_types_url
    click_on "New Identity Document Type"

    fill_in "Account", with: @identity_document_type.account_id
    fill_in "Description", with: @identity_document_type.description
    fill_in "Name", with: @identity_document_type.name
    fill_in "Status", with: @identity_document_type.status
    fill_in "Uid", with: @identity_document_type.uid
    click_on "Create Identity document type"

    assert_text "Identity document type was successfully created"
    click_on "Back"
  end

  test "updating a Identity document type" do
    visit identity_document_types_url
    click_on "Edit", match: :first

    fill_in "Account", with: @identity_document_type.account_id
    fill_in "Description", with: @identity_document_type.description
    fill_in "Name", with: @identity_document_type.name
    fill_in "Status", with: @identity_document_type.status
    fill_in "Uid", with: @identity_document_type.uid
    click_on "Update Identity document type"

    assert_text "Identity document type was successfully updated"
    click_on "Back"
  end

  test "destroying a Identity document type" do
    visit identity_document_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Identity document type was successfully destroyed"
  end
end
