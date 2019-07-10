class My::HomeController < ApplicationController

  def index

    respond_to do |format|
      format.html
      format.html.phone
    end
  end


end
