class ExploreController < ApplicationController


  def index

    if user_signed_in?
      @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
    end



  end

  def get_nearby_sounds

    #@current_location = request.location
    @current_location = Geocoder.search(params[:location])[0]
    @distance = params[:distance].to_f
    @sounds = Sound.all
    @locations = []

    @sounds.each do |sound|

      sound_latitude = sound.location.split(',')[1]
      sound_longitude = sound.location.split(',')[0]

      Geocoder.search("#{sound_latitude},#{sound_longitude}")[0].formatted_address

      dist = Geocoder::Calculations.distance_between(
          [@current_location.latitude, @current_location.longitude],
          [sound_latitude, sound_longitude]
      )

      if dist <= @distance
        @locations << {
            'sound' => sound,
            'data' => Geocoder.search(sound.location.split(',')[1] + ',' + sound.location.split(',')[0])[0].formatted_address,
            'distance' => dist
        }
      end

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {:data => @locations, :current => @current_location} }
    end

  end

end
