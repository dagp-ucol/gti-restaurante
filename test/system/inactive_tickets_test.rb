require "application_system_test_case"

class InactiveTicketsTest < ApplicationSystemTestCase
  setup do
    @inactive_ticket = inactive_tickets(:one)
  end

  test "visiting the index" do
    visit inactive_tickets_url
    assert_selector "h1", text: "Inactive Tickets"
  end

  test "creating a Inactive ticket" do
    visit inactive_tickets_url
    click_on "New Inactive Ticket"

    click_on "Create Inactive ticket"

    assert_text "Inactive ticket was successfully created"
    click_on "Back"
  end

  test "updating a Inactive ticket" do
    visit inactive_tickets_url
    click_on "Edit", match: :first

    click_on "Update Inactive ticket"

    assert_text "Inactive ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Inactive ticket" do
    visit inactive_tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inactive ticket was successfully destroyed"
  end
end
