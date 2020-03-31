
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/articles"
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
    # @article = Article.new
    erb :new
  end

  post "/articles" do
    @article = Article.find_or_create_by(params)
    redirect "/articles/#{@article.id}"
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    params.delete("_method")
    if @article.update(params) 
      redirect "/articles/#{@article.id}"
    else
      erb :edit
    end
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
end