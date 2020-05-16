require_relative('../models/phones.rb')
require ('pry')

phone1 = Phone.new({
  'name' => 'iPhone XS Max',
  'storage' => '256GB',
  'colour' => 'Black'
  })

phone2 = Phone.new({
  'name' => 'iPhone SE',
  'storage' => '32GB',
  'colour' => 'Silver'
  })

phone3 = Phone.new({
  'name' => 'Samsung Galaxy S10',
  'storage' => '64GB',
  'colour' => 'Black'
  })

Phone.delete_all

phone1.save
phone2.save
phone3.save

binding.pry
nil
