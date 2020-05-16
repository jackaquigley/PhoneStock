require_relative('../models/phones.rb')
require ('pry')

phone1 = Phone.new({
  'name' => 'iPhone XS Max',
  'storage' => '256GB',
  'colour' => 'Black',
  'buy_price' => 815,
  'sell_price' => 1100
  })

phone2 = Phone.new({
  'name' => 'iPhone SE',
  'storage' => '32GB',
  'colour' => 'Silver',
  'buy_price' => 120,
  'sell_price' => 300
  })

phone3 = Phone.new({
  'name' => 'Samsung Galaxy S10',
  'storage' => '64GB',
  'colour' => 'Black',
  'buy_price' => 880,
  'sell_price' => 1095
  })

Phone.delete_all

phone1.save
phone2.save
phone3.save

binding.pry
nil
