require "application_system_test_case"

class CurrenciesTest < ApplicationSystemTestCase
  setup do
    @currency = currencies(:one)
  end

  test "visiting the index" do
    visit currencies_url
    assert_selector "h1", text: "Currencies"
  end

  test "creating a Currency" do
    visit currencies_url
    click_on "New Currency"

    fill_in "Account", with: @currency.account_id
    fill_in "Decimal symbol", with: @currency.decimal_symbol
    fill_in "Iso code", with: @currency.iso_code
    fill_in "Name", with: @currency.name
    fill_in "Status", with: @currency.status
    fill_in "Symbol", with: @currency.symbol
    fill_in "Symbol position", with: @currency.symbol_position
    fill_in "Thousand separator", with: @currency.thousand_separator
    fill_in "Uid", with: @currency.uid
    click_on "Create Currency"

    assert_text "Currency was successfully created"
    click_on "Back"
  end

  test "updating a Currency" do
    visit currencies_url
    click_on "Edit", match: :first

    fill_in "Account", with: @currency.account_id
    fill_in "Decimal symbol", with: @currency.decimal_symbol
    fill_in "Iso code", with: @currency.iso_code
    fill_in "Name", with: @currency.name
    fill_in "Status", with: @currency.status
    fill_in "Symbol", with: @currency.symbol
    fill_in "Symbol position", with: @currency.symbol_position
    fill_in "Thousand separator", with: @currency.thousand_separator
    fill_in "Uid", with: @currency.uid
    click_on "Update Currency"

    assert_text "Currency was successfully updated"
    click_on "Back"
  end

  test "destroying a Currency" do
    visit currencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currency was successfully destroyed"
  end
end
