class PrelaunchController < ActionController::Base
  layout 'prelaunch'

  def new
    @prelaunch_subscriber = PrelaunchSubscriber.new
  end

  def create
    @prelaunch_subscriber = PrelaunchSubscriber.new(params.require(:prelaunch_subscriber).permit(:email))
    if @prelaunch_subscriber.save
      redirect_to root_url, :notice => 'Thank you for your interest. We have sent you an email to confirm your subscription to our prelaunch mailing list.'
    else
      render :action => 'new'
    end
  end

end
