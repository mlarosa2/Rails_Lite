require_relative '../models/dog'

class DogsController < ControllerBase
  def create
    DogsController.protect_from_forgery # Turns on CSRF protection

    @dog = Dog.new(params["dog"])
    if @dog.save
      flash[:notice] = "Saved dog successfully"
      redirect_to "/dogs"
    else
      flash.now[:errors] = @dog.errors
      render :new
    end
  end

  def index
    @dogs = Dog.all
    render :index
  end

  def new
    @dog = Dog.new
    render :new
  end
end
