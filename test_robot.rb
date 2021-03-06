require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    foreign_robot = Robot.new
    foreign_robot.foreign_model=(true)
    foreign_robot.needs_repairs=(true)
    # act
    expected_result = 1 
    actual_result = foreign_robot.station
    # assert
    assert_equal(expected_result, actual_result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    
    # arrange
    vintage_robot = Robot.new
    vintage_robot.vintage_model=(true)
    vintage_robot.needs_repairs=(true)
    # act
    expected_result = 2
    actual_result = vintage_robot.station
    # assert
    assert_equal(expected_result, actual_result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    
    # arrange
    standard_issue = Robot.new
    standard_issue.needs_repairs=(true)
    # act
    expected_result = 3
    actual_result = standard_issue.station
    # assert
    assert_equal(expected_result, actual_result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    
    # arrange
    good_looking_strong_vintage_model = Robot.new
    # act
    expected_result = 4
    actual_result = good_looking_strong_vintage_model.station
    # assert
    assert_equal(expected_result, actual_result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    
    # arrange
    standard_issue = Robot.new
    # act
    expected_result = -1
    actual_result = standard_issue.prioritize_tasks
    # assert
    assert_equal(expected_result, actual_result)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    
    # arrange
    standard_issue = Robot.new
    standard_issue.todos=(['infiltrate the resistance', 'hurt children'])
    # act
    expected_result = 'infiltrate the resistance'
    actual_result = standard_issue.prioritize_tasks
    # assert
    assert_equal(expected_result, actual_result)
  end

  def test_workday_on_day_off_returns_false
    
    # arrange
    standard_issue = Robot.new
    standard_issue.day_off=(12)

    # act
    expected_result = false
    actual_result = standard_issue.workday?(12)
    # assert
    assert_equal(expected_result, actual_result)
  end

  def test_workday_not_day_off_returns_true
    
    # arrange
    standard_issue = Robot.new
    standard_issue.day_off=(12)
    # act
    expected_result = true
    actual_result = standard_issue.workday?(13)
    # assert
    assert_equal(expected_result, actual_result)
  end

end
