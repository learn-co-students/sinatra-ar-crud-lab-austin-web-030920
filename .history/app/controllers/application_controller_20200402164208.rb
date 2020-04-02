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
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles/:id' do
    #the id came from the form's action attribute
    @article = Article.find(params[:id])
    #find the article and update based on form params
    @article.update(params[:article])
    #use the id this time to request the show route
    redirect to "articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    # binding.pry
    @article = Article.find(params[:id])
    params.delete("_method")
    @article.update(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/delete/:id' do
    
  end
end
