class TitlesController < ApplicationController
  #index action
  get "/titles" do
    @titles = Title.all
    erb :"titles/index"
  end

  #new action
  get "/titles/new" do
    erb :"titles/new"
  end

  post "/titles" do
    @title = Title.create(params[:title])
    redirect to "titles/#{@title.id}"
  end

  #show action
  get "/titles/:id" do
    @title = Title.find(id: params[:id])
    erb :"titles/show"
  end

  #update action
  get "/titles/:id/edit" do
    @title = Title.find(id: params[:id])
    erb :"titles/edit"
  end

  patch "/titles/:id" do
    @title = Title.find(id: params[:id])
    @title.name = params[:title][:name]
    @title.save
    redirect to "/titles/#{@title.id}"
  end

end
