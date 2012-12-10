class ExploreController < ApplicationController


  def index

    @current_page = 'explore'

    if user_signed_in?
      @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
    end



  end

  def like(sound_id)
    if user_signed_in?
      @current_user = User.find(current_user.id)

      @current_user.likes.each do |like|
        if like.favored_sound_id == sound_id
          return true
        end
      end
    end

    false
  end

  def set_like
    if user_signed_in?
      @current_user = User.find(current_user.id)
      sound_id = params[:id].to_i
      is_like = false
      like_result = Like.where('user_id = ? AND favored_sound_id = ?', current_user.id, sound_id)

      if like_result.length > 0
        like_result[0].destroy
        is_like = false
      else
        Like.new(:favored_sound_id => sound_id, :user_id => current_user.id).save
        is_like = true
      end

      respond_to do |format|
        format.json { render :json => {:user_id => current_user.id, :sound_id => sound_id, :is_like => is_like} }
      end
    end
  end

  def nearbytest

    #@current_location = request.location
    candidates = ['Paris', 'Berlin', 'London', 'Los Angeles', 'New York', 'Beijing', 'Shanghai', 'Tokyo', 'San Fransisco', 'San Diego', 'Santa Barbara']

    @current_location = Geocoder.search(candidates[rand(0..candidates.length - 1)])[0]
    @distance = params[:distance].to_f
    @sounds = Sound.where(
        'longitude > ? AND longitude < ? AND latitude > ? AND latitude < ?',
        @current_location.latitude - 0.03, @current_location.latitude + 0.031,
        @current_location.longitude - 0.03, @current_location.longitude + 0.03
    )

    @locations = []

    @sounds.each do |sound|

      #sound_latitude = sound.location.split(',')[1]
      #sound_longitude = sound.location.split(',')[0]
      sound_latitude = sound.longitude
      sound_longitude = sound.latitude

      #Geocoder.search("#{sound_latitude},#{sound_longitude}")[0].formatted_address
      #
      dist = Geocoder::Calculations.distance_between(
          [@current_location.latitude, @current_location.longitude],
          [sound_latitude, sound_longitude]
      )

      #if dist <= @distance
      @locations << {
          'sound' => sound,
          'user_id' => sound.user.id,
          'username' => sound.user.email,
          'data' => 'A Place', #Geocoder.search(sound.location.split(',')[1] + ',' + sound.location.split(',')[0])[0].formatted_address,
          'distance' => dist,
          'like' => like(sound.id)
      }
      #end

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {:data => @locations, :current => @current_location} }
    end

  end

  def get_nearby_sounds

    #@current_location = request.location
    @current_location = Geocoder.search(params[:location])[0]
    @distance = params[:distance].to_f
    @sounds = Sound.where(
        'longitude > ? AND longitude < ? AND latitude > ? AND latitude < ?',
        @current_location.latitude - 0.03, @current_location.latitude + 0.031,
        @current_location.longitude - 0.03, @current_location.longitude + 0.03
    )

    @locations = []

    @sounds.each do |sound|

      #sound_latitude = sound.location.split(',')[1]
      #sound_longitude = sound.location.split(',')[0]
      sound_latitude = sound.longitude
      sound_longitude = sound.latitude

      #Geocoder.search("#{sound_latitude},#{sound_longitude}")[0].formatted_address
      #
      dist = Geocoder::Calculations.distance_between(
          [@current_location.latitude, @current_location.longitude],
          [sound_latitude, sound_longitude]
      )

      #if dist <= @distance
      @locations << {
          'sound' => sound,
          'user_id' => sound.user.id,
          'username' => sound.user.email,
          'data' => 'A Place', #Geocoder.search(sound.location.split(',')[1] + ',' + sound.location.split(',')[0])[0].formatted_address,
          'distance' => dist,
          'like' => like(sound.id)
      }
      #end

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {:data => @locations, :current => @current_location} }
    end

  end

end
