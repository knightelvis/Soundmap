class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def sounds
    @user = User.find(params[:id])

    respond_to do |format|
      format.json { render json: { :sounds => @user.sounds, :favored_sounds => @user.favored_sounds } }
    end
  end

end
