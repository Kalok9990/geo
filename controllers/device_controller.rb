require 'sinatra'
require 'sinatra/reloader' if development?

class DeviceController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # Sets the view directory correctly
  set :views, Proc.new{File.join(root, "views")}

  # Enables the reloader so we dont need to keep restarting the server
  configure :development do
    register Sinatra::Reloader
  end

  # A get request to the / route will respond with our index template with all the devices from the model
  get "/" do
    @title = "Devices"
    i = Device.new
    @names = i.get_all_names
    erb :"index"
  end

  # A get request to /:id will respond with a the show template with the requested post
  get "/:name" do
    name = params[:name]
    i = Device.new
    @selected = i.find(name)
    erb :"show"
  end
end
