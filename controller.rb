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

get '/phones/:id/edit' do
  @phones = Phone.all
  erb(:edit)
end

get '/phones/add' do
  erb(:new)
end

post '/phones/:id/edit' do
  phone = Phone.new(params)
  phone.update
  redirect to '/phones'
end

post '/phones' do
  Phone.new(params).save
  redirect to '/phones'
end
