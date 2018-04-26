class LandmarksController < ApplicationController
 get "/landmarks" do
   @landmarks = Landmark.all
   erb :"landmarks/index"
 end

 get "/landmarks/new" do
   erb :"landmarks/new"
 end

 post "/landmarks" do
   @landmark = Landmark.create(name: params[:landmark][:name], figure_id: params[:landmark][:figure_id], year_completed: params[:landmark][:year_completed])
   redirect "/landmarks/#{@landmark.id}"
 end

 #show action
 get "/landmarks/:id" do
   @landmark = Landmark.find(params[:id])
   erb :"/landmarks/show"
 end

 #update action
 get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
 end

 patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.figure_id = params[:landmark][:figure_id]
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
 end
end
