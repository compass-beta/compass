class FeedsController < ApplicationController
  layout 'feed'
  before_action :now_user, only: [:top, :base]
  
  def top
    
  end

  def base
    
  end

  private

    def now_user
      @user = User.find(session[:user_id])
    end
end
