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
        @article = Article.new
    end

    def create
        # To whitelist what's comming in from the the web by using params.require(:'specify the top level of key').permit('specefy the keys that you wants to permit')
        @article = Article.new(params.require(:article).permit(:title, :description))

        if @article.save
            flash[:notice] = "Article was saved successfully. "
            #redirect_to 'Prefix_path of the page you want to redirect(in this case, you should specify the show page's Prefix and provide id)'
            # Or also you can write like 'redirect_to @article'
            redirect_to @article
        else
            # @article(instance variables that are made in this method) is gonna be available in new page
            render 'new'
        end
    end
end