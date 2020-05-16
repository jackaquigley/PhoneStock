require('sinatra')
require('sinatra/contrib/all')
# require_relative('models/network')
require_relative('models/phones.rb')

get '/phones' do
  @phones = Phone.all
  erb(:index)
end
