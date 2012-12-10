class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    #tag_sound_relation = RTagSound.find_all_by_tag_id(params[:id])
    @sounds = @tag.sounds.paginate(:page => params[:page], :per_page => 15)

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @user }
    end
  end

  def showtest

    @tag = Tag.find(rand(1..1000))
    #tag_sound_relation = RTagSound.find_all_by_tag_id(params[:id])
    @sounds = @tag.sounds.paginate(:page => params[:page], :per_page => 15)

    respond_to do |format|
      format.html # show.html.erb
                  #format.json { render json: @user }
    end

  end

end
