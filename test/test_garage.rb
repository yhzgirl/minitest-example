require './lib/bike' # the class under test
require './lib/garage'
require 'minitest/autorun'
 # the minitest itself
# require 'ansi' # makes it colored
# require 'turn' # improves the default output

class TestGarage < MiniTest::Unit::TestCase

  def setup
    @garage = Garage.new
    @bike = Bike.new
  end

  def test_garage_can_receive_bike
    @garage<<(@bike)
    assert_equal(1, @garage.count_bikes)
  end

  def test_garage_can_release_bike
    @garage<<(@bike)
    @garage.release_bike(@bike)
    assert @garage.count_bikes == 0
  end

  def test_garage_capacity_returns_false_once_reached
    Garage::CAPACITY.times { @garage<<(Bike.new)}
    assert_raises(RuntimeError) {
      @garage<<(Bike.new) 
    }
  end
end