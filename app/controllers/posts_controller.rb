class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
          @post = Post.new(params[:post].permit(:title, :content))

          if @post.save
              redirect_to @post
          else
              render 'new'
          end
      end

      def show
          @post = Post.find(params[:id])
      end

      def index
          @posts = Post.order("created_at desc")
      end

      private
          def post_params
              params.require(:post).permit(:title, :content)
          end

  end
