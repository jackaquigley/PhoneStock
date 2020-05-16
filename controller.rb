require('sinatra')
require('sinatra/contrib/all')
# require_relative('models/network')
require_relative('models/phones')
also_reload('./models/*')

get '/phones' do
  @phones = Phone.all
  erb(:index)
end

get '/phones/:id/sell' do
  phone = Phone.find(params['id'])
  phone.delete
  redirect to '/phones'
end
