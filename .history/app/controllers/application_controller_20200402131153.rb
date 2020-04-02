require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    # binding.pry
    @title = params[:title]
    @content = params[:content]
    @article = Article.create(@title, @content)
    erb :show
  end
end
