class Admin::HomeController < AdminController

  def index
    respond_to do |format|
      format.html.phone
      format.html
    end
  end
  
  def program

  end

end
