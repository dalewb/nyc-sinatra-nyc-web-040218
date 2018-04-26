class LandmarksController < ApplicationController
 get "/landmarks" do
   @landmarks = Landmark.all
   erb :"landmarks/index"
 end

 get "/landmarks/new" do
   erb :"landmarks/new"
 end

 post "/landmarks" do
   @landmark = Landmark.create(params[:landmark])
   redirect "/landmarks/#{@landmark.id}"
 end

 #show action
 get "/landmarks/:id" do
   @landmark = Landmark.find(id: params[:id])
   erb :show
 end

 #update action
 get "/landmarks/:id/edit" do
    @landmark = Landmark.find(id: params[:id])
    erb :edit
 end

 patch "/landmarks/:id" do
    @landmark = Landmark.find(id: params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
 end
end
