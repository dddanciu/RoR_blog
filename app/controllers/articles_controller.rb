class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def new
    @article = Article.new
  end
  
  def create
          @article = Article.new(params[:article].permit(:title, :text))

          if @article.save
              redirect_to @article, :flash => { :success => t(:article_created) } 
          else
              render 'new'
          end
      end

      def show
          @article = Article.find(params[:id])
      end

      def index
          @articles = Article.all
      end
      
      def edit
        @article = Article.find(params[:id])
      end
      
      def update
        @article = Article.find(params[:id])
         if @article.update_attributes article_params
          redirect_to @article, :flash => { :success => t(:article_updated) } 
        else
          render 'edit'
        end
      end
      
      def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
      end

      private
          def article_params
              params.require(:article).permit(:title, :text)
          end

  end
  
