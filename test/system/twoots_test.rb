require "application_system_test_case"

class TwootsTest < ApplicationSystemTestCase
  setup do
    @twoot = twoots(:one)
  end

  test "visiting the index" do
    visit twoots_url
    assert_selector "h1", text: "Twoots"
  end

  test "creating a Twoot" do
    visit twoots_url
    click_on "New Twoot"

    fill_in "Body", with: @twoot.body
    click_on "Create Twoot"

    assert_text "Twoot was successfully created"
    click_on "Back"
  end

  test "updating a Twoot" do
    visit twoots_url
    click_on "Edit", match: :first

    fill_in "Body", with: @twoot.body
    click_on "Update Twoot"

    assert_text "Twoot was successfully updated"
    click_on "Back"
  end

  test "destroying a Twoot" do
    visit twoots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twoot was successfully destroyed"
  end
end
