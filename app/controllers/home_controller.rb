class HomeController < ApplicationController
  before_action :check_variant

  def index
    @post = Post.find_by(code: 'home/index')
  end

  def uptoken
    uptoken = QiniuHelper.generate_uptoken(nil)
    render json: { uptoken: uptoken, key: nil }
  end

  private
  def generate_key
    timestamp = Time.now.to_s(:nsec)
    salt = rand(10000000..99999999).to_s
    timestamp << '-' << salt
  end

  def check_variant
    request.variant = :phone if request.user_agent =~ /iPad|iPhone|iPod|Android/
    request.variant = :phone if request.host == 'm.one.work'
  end


end
