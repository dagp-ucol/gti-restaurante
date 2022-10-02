require "test_helper"

class InactiveTicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inactive_ticket = inactive_tickets(:one)
  end

  test "should get index" do
    get inactive_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_inactive_ticket_url
    assert_response :success
  end

  test "should create inactive_ticket" do
    assert_difference('InactiveTicket.count') do
      post inactive_tickets_url, params: { inactive_ticket: {  } }
    end

    assert_redirected_to inactive_ticket_url(InactiveTicket.last)
  end

  test "should show inactive_ticket" do
    get inactive_ticket_url(@inactive_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_inactive_ticket_url(@inactive_ticket)
    assert_response :success
  end

  test "should update inactive_ticket" do
    patch inactive_ticket_url(@inactive_ticket), params: { inactive_ticket: {  } }
    assert_redirected_to inactive_ticket_url(@inactive_ticket)
  end

  test "should destroy inactive_ticket" do
    assert_difference('InactiveTicket.count', -1) do
      delete inactive_ticket_url(@inactive_ticket)
    end

    assert_redirected_to inactive_tickets_url
  end
end
