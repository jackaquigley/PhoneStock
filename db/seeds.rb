require_relative('../models/phones.rb')

phone1 = Phone.new({
  'name' => 'iPhone XS Max',
  'storage' => '256GB',
  'colour' => 'Black'
  })

phone1.save
