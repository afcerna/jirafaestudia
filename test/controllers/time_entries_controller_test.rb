require 'test_helper'

class TimeEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_entry = time_entries(:one)
  end

  test "should get index" do
    get time_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_time_entry_url
    assert_response :success
  end

  test "should create time_entry" do
    assert_difference('TimeEntry.count') do
      post time_entries_url, params: { time_entry: { Project_id: @time_entry.Project_id, date: @time_entry.date, description: @time_entry.description, number_of_hours: @time_entry.number_of_hours } }
    end

    assert_redirected_to time_entry_url(TimeEntry.last)
  end

  test "should show time_entry" do
    get time_entry_url(@time_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_entry_url(@time_entry)
    assert_response :success
  end

  test "should update time_entry" do
    patch time_entry_url(@time_entry), params: { time_entry: { Project_id: @time_entry.Project_id, date: @time_entry.date, description: @time_entry.description, number_of_hours: @time_entry.number_of_hours } }
    assert_redirected_to time_entry_url(@time_entry)
  end

  test "should destroy time_entry" do
    assert_difference('TimeEntry.count', -1) do
      delete time_entry_url(@time_entry)
    end

    assert_redirected_to time_entries_url
  end
end
