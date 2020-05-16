require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('/models/phones.rb')

class PhoneTest < Minitest::Test

  def setup
    @phone1 = Phone.new({
      'name' => 'I-Phone XS Max',
      'storage' => '256GB',
      'colour' => 'Black'
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

end
