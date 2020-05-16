require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/phones.rb')

class PhoneTest < Minitest::Test

  def setup
    @phone1 = Phone.new({
      'name' => 'I-Phone XS Max',
      'storage' => '256GB',
      'colour' => 'Black',
      'buy_price' => 450,
      'sell_price' => 775
    })
  end

  def test_phone_has_name
    assert_equal("I-Phone XS Max", @phone1.name)
  end

  def test_phone_has_storage
    assert_equal('256GB', @phone1.storage)
  end

  def test_phone_has_colour
    assert_equal('Black', @phone1.colour)
  end

  def test_phone_has_buy_price
    assert_equal(450, @phone1.buy_price)
  end

  def test_phone_has_sell_price
    assert_equal(775, @phone1.sell_price)
  end

end
