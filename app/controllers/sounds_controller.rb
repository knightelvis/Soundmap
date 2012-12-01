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

  def get_sounds_in_bound
    maxX = params[:maxX].to_f
    maxY = params[:maxY].to_f
    minX = params[:minX].to_f
    minY = params[:minX].to_f

    @sounds = Sound.where('latitude > ?')
  end

  # GET /sounds/1
  # GET /sounds/1.json
  def show
    @sound = Sound.find(params[:id])
    @tags = RTagSound.find_all_by_sound_id(@sound.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {sound: @sound, tags: @tags} }
    end
  end

  # GET /sounds/new
  # GET /sounds/new.json
  def new
    @sound = Sound.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound }
    end
  end

  # GET /sounds/1/edit
  def edit
    @sound = Sound.find(params[:id])
    unless current_user.id == @sound.user.id
      flash[:error] = 'You can only edit your own sounds!'
      redirect_to '/'
    end
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

  def store_tags(str_tags, sound_id)
    #split all tags
    tags = str_tags.to_s.split(',')

    for tag in tags
      #store info into "r_tag_sound"
      create_rts(tag, sound_id)
    end

    return true
  end

  # update r_tag_sounds
  def update_tags
    sound_id = params[:id]
    #get new and old tags
    new_tags = params[:tags].to_s.split(',')
    rtss = RTagSound.find_all_by_sound_id(sound_id)

    #For new tag, create related 'r_tag_sound'
    for nt in new_tags
      exist = false
      for rts in rtss
         if nt == rts.tag_title
           exist = true
           break
         end
      end

      if not exist
        create_rts(nt, sound_id)
      end
    end

    #For removed tag, delete related 'r_tag_sound'
    for rts in rtss
      exist = false
      for nt in new_tags
        if nt == rts.tag_title
          exist = true
          break
        end
      end

      if not exist
        delete_rts(rts)
      end
    end


    rtss = RTagSound.find_all_by_sound_id(params[:id])
    respond_to do |format|
      format.json { render json: rtss }
    end
  end

  #store info into "r_tag_sound"
  def create_rts(tag_title, sound_id)
    unless tag = Tag.find_by_title(tag_title)
      tag = Tag.new
      tag.set(tag_title)
      tag.save
    end

    r_tag_sound = RTagSound.new
    r_tag_sound.set(tag.id, tag.title, sound_id)
    r_tag_sound.save
    tag.increment()

    return r_tag_sound
  end

  #delete r_tag_sound
  def delete_rts(rts)
    tag = Tag.find(rts.tag_id)
    tag.decrement()
    rts.destroy
  end
end
