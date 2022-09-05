require "open-uri"

class FetchWeather

  def initialize(current_user)
    @user = current_user
  end

  def call
    # dans le rails console : user = User.first // relancer la console
    #FetchWeather.new(user).call
    #info : "tempmax", "tempmin", "conditions",  "icon"
    scrap
  end

  private

  def scrap
    # array = []
    url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{@user.address}?unitGroup=metric&key=RC2YF7W2CCMRM6VU9YG9FSE5Q&contentType=json"
    user_serialized = URI.open(url).read
    today = JSON.parse(user_serialized).dig('days').first

    {
      tempmin: today["tempmin"],
      tempmax: today["tempmax"],
      temp: today["temp"],
      conditions: today["conditions"],
      icon: today["icon"]
    }
  end
end
