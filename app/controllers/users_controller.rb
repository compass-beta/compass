class UsersController < ApplicationController
  #デフォルトでは、コントローラ内の全てのアクションに適用される(onlyでアクションの適用範囲を指定できる)
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "登録が完了しました！"
  		redirect_to root_url(@root)
  	else
  		render 'new'
  	end
  end

  def show
    # idはURLから取ってきてる
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # 懇親に成功した場合
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  	end

    #beforeアクション

    #ログイン済みかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    #正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
