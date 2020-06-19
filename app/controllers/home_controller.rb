class HomeController < ApplicationController
  before_action :check_variant

  def index
    @post = Post.find_by(code: 'home/index')
  end

  private
  def check_variant
    request.variant = :phone if request.user_agent =~ /iPad|iPhone|iPod|Android/
    request.variant = :phone if request.host == 'm.one.work'
  end

end
