class PizzaShop < Sinatra::Base

#root route
get "/" do
  redirect('/pizzas')
end

# index
get '/pizzas' do
  @pizza = Pizza.all
  erb(:"pizzas/new")
end

#new
get '/pizzas' do
  @pizza = Pizza.new
  erb(:"pizzas/new")
end

#create
post '/pizzas' do
  @psizza = Pizza.new(params[:song])
  if @ pizza.save
    redirect("/pizzas/#{@pizza.id}")
  else
    erb(:"pizzas/new")
end

# show
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:"pizzas/show")
end

#update
post '/pizzas/:id/update' do
  @pizza = Pizza.find(params[:id])
  @pizza.update_attributes(params[:pizza])
    if @pizza.save
    redirect("/pizzas")
  else
    erb(:"pizzas/new")
  end
end

# destroy
post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  if @pizza.destroy
    redirect('/pizzas')
  else
    redirect("/pizzas/#{@pizza.id}")
  end
end

end
