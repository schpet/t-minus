class PrelaunchController < ActionController::Base
  layout 'prelaunch'

  def new
    unless session[:prelaunch_subscriber] == true
      @prelaunch_subscriber = PrelaunchSubscriber.new
    end
  end

  def create
    @prelaunch_subscriber = PrelaunchSubscriber.new(params.require(:prelaunch_subscriber).permit(:email))
    if @prelaunch_subscriber.save
      session[:prelaunch_subscriber] = true
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

end
