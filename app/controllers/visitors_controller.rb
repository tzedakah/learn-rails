class VisitorsController < ApplicationController

  def new
  # Rails.logger.debug 'DEBUG: entering new method'
  # @owner = Owner.new
  # Rails.logger.debug 'DEBUG: Owner name is  '+ @owner.name
  # raise 'Deliberate Failure'
  # DISASTER
  # render 'visitors/new'
  # flash.now[:notice] = 'Welcome!'
  # flash.now[:alert] = 'My birthday is soon.'
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def secure_params
    params.require(:visitor).permit(:email)
  end

end