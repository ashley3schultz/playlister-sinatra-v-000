class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @list = Song.all
    erb :'songs/index'
  end

  get '/genres' do
    @list = Genre.all
    erb :'genres/index'
  end

  get '/artists' do
    @list = Artist.all
    erb :'artists/index'
  end

  get '/songs/:slug' do
    @slug = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/genres/:slug' do

    erb :'genres/show'
  end

  get '/artists/:slug' do

    erb :'artists/show'
  end

end
