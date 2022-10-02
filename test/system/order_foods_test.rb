require "application_system_test_case"

class OrderFoodsTest < ApplicationSystemTestCase
  setup do
    @order_food = order_foods(:one)
  end

  test "visiting the index" do
    visit order_foods_url
    assert_selector "h1", text: "Order Foods"
  end

  test "creating a Order food" do
    visit order_foods_url
    click_on "New Order Food"

    fill_in "Food", with: @order_food.food_id
    fill_in "Ticket", with: @order_food.ticket_id
    click_on "Create Order food"

    assert_text "Order food was successfully created"
    click_on "Back"
  end

  test "updating a Order food" do
    visit order_foods_url
    click_on "Edit", match: :first

    fill_in "Food", with: @order_food.food_id
    fill_in "Ticket", with: @order_food.ticket_id
    click_on "Update Order food"

    assert_text "Order food was successfully updated"
    click_on "Back"
  end

  test "destroying a Order food" do
    visit order_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order food was successfully destroyed"
  end
end
