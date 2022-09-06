class GardensController < ApplicationController

  def show
    @user_plants = current_user.user_plants
    # @user_plant = UserPlant.find(params[:id])
    coucou = FetchWeather.new(current_user).call
    if coucou[:icon] == "rain"
      @sky = "🌧"
      if coucou[:icon] == "partly-cloudy-day"
        @sky = "⛅️"
        if coucou[:icon] == "cloudy"
          @sky = "🌥"
          if coucou[:icon] == "partly-cloudy-night"
            @sky = "🌥"
            if coucou[:icon] == "clear-day"
              @sky = "🌞"
            else
              @sky = ""
            end
          end
        end
      end
    end


@max = coucou[:tempmax]
@min = coucou[:tempmin]
@med = coucou[:temp]
@cond = coucou[:conditions]

  end
end
