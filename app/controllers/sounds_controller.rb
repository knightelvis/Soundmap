class SoundsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  # GET /sounds
  # GET /sounds.json
  def index
    @sounds = Sound.all

    respond_to do |format|
      format.json { render json: @sounds }
    end
  end

  # GET /sounds/1
  # GET /sounds/1.json
  def show
    @sound = Sound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sound }
    end
  end

  # GET /sounds/new
  # GET /sounds/new.json
  def new
    @sound = Sound.new
    @r_tag_sound = RTagSound.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound }
    end
  end

  # GET /sounds/1/edit
  def edit
    @sound = Sound.find(params[:id])
  end

  # POST /sounds
  # POST /sounds.json
  def create
    @sound = Sound.new(params[:sound])

    respond_to do |format|
      if @sound.save and store_tags(params[:tmp_tags], @sound.id)
        format.html { redirect_to map_view_index_path, notice: 'Sound was successfully created.' }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sounds/1
  # PUT /sounds/1.json
  def update
    @sound = Sound.find(params[:id])

    respond_to do |format|
      if @sound.update_attributes(params[:sound])
        format.html { redirect_to @sound, notice: 'Sound was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sounds/1
  # DELETE /sounds/1.json
  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy

    respond_to do |format|
      format.html { redirect_to sounds_url }
      format.json { head :no_content }
    end
  end

  def xxl_test
    flash[:warning] =  "I am here!!!"
  end

  def store_tags(str_tags, sound_id)
    #split all tags
    tags = str_tags.to_s.split(',')

    #store info into "r_tag_sound"

    #store info into "tags"
    for t in tags
      tag = Tag.new
      tag.title = t
      tag.save

      r_tag_sound = RTagSound.new()
      r_tag_sound.tag_id = tag.id
      r_tag_sound.tag_title = tag.title
      r_tag_sound.sound_id = sound_id
      r_tag_sound.save
    end

    return true
  end
end
