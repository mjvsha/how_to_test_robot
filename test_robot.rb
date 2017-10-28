require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def setup
    @robot = Robot.new
  end


  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @robot.needs_repairs = true
    @robot.foreign_model = true

    # act
    send_repair = @robot.station

    # assert
    assert_equal 1, send_repair
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    @robot.needs_repairs = true
    @robot.vintage_model = true
    # act
    send_repair = @robot.station

    # assert
    assert_equal 2, send_repair
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    @robot.needs_repairs = true

    # act
    send_repair = @robot.station

    # assert
    assert_equal 3, send_repair
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    @robot.needs_repairs = false


    # act
    send_repair = @robot.station

    # assert
    assert_equal 4, send_repair
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    @todos = []

    # act
    todos_value = @robot.prioritize_tasks

    # assert
    assert_equal -1, todos_value
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    add = [5,3,2]
    @robot.todos = add

    # act
    todos_value = @robot.prioritize_tasks

    # assert
    assert_equal 5, todos_value

  end

  def test_workday_on_day_off_returns_false

    # arrange
    @robot.day_off=(true)
    today = true
    #act
    day_check = @robot.workday?(today)
    # assert
    assert_equal false, day_check
  end

  def test_workday_not_day_off_returns_true

    # arrange
    @robot.day_off=(false)
    today = true
    # act

    day_check = @robot.workday?(today)

    # assert

    assert_equal = true, day_check
  end

end
