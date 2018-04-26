class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post "/figures" do
    binding.pry
    @figure = Figure.create(params[:figure])
    redirect to "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(id: params[:id])
    erb :"/figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(id: params[:id])
    erb :"/figures/edit"
  end

  patch "/figures/:id" do
    @figure = Figure.find(id: params[:id])
    @figure.name = params[:figure][:name]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
