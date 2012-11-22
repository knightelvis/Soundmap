class UserController < ApplicationController

  def recent

    @user = User.find(params[:id])
    @recent_sound = @user.sound[0]

  end

end
