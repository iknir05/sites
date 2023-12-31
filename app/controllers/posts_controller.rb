class PostsController < ApplicationController
  def home
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new 
  end

  def create
     @post = Post.new(post_params)

     if @post.save
        flash[:notice] = "Post has been successfully created"
        redirect_to @post
     else
        render 'new'
     end
  end

  def edit
    @post = Post.find(params[:id])    
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post has been successfully updated"
      redirect_to home_path
    else
      render 'edit'
    end    
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy(post_params)
      flash[:notice] = "Post has been successfully deleted"
      redirect_to home_path
    else
      render 'edit'
    end    
    
  end

  private
  def post_params()
    params.require(:post).permit(:title,:description,:reaction)
  end
end
