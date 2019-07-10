class Waiting::Admin::PostsController < Waiting::Admin::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    q_params = {}.with_indifferent_access
    q_params.merge! params.fetch(:q, {}).permit!
    @posts = Post.default_where(q_params).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_url
    else
      render :new
    end
  end

  def show
    @pictures = @post.pictures
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_url
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_url
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.fetch(:post, {}).permit(:name, :code)
  end

end
