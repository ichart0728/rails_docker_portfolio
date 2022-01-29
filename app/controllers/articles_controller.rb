class ArticlesController < ApplicationController
    def show
        # params[:id] :get 'id' parameter from url
        # put '@' before a variable name to turn it into a instance variable in order to be able to use in show.html.erb
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new

    end

    def create
        
    end
end