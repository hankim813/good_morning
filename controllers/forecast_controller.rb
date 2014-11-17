# encoding: utf-8
require 'forecast_io'

class ForecastFor
	def self.setup
		ForecastIO.configure do |configuration|
			configuration.api_key = 'GET YOUR OWN'
		end
		@forecast = ForecastIO.forecast(37.7833, -122.4167)
	end

	def self.weekly
		@forecast.daily.map do |item|
			item[0] == "summary" ? (WeatherView.forecast_view(item[1])) : (nil)
			item[0] == "icon" ? (WeatherView.icon_render(item[1])) : (nil)
		end
	end
end

class WeatherView
	def self.forecast_view(weather)
		puts "\033[1mWeekly Weather Watch\033[0m:"
		puts
		puts "#{weather}".rjust(30)
	end

	def self.icon_render(icon_code)
		puts
		puts
		case icon_code
		when "clear-day" then puts "☀ "*10
		when "cloudy" || "partly-cloudy-day" || "partly-cloudy-night" then puts "☁ "*10
		when "rain" then puts "☔ "*10
		when "snow" || "sleet" then puts "☃"*10
		else
			puts "look out the window"
		end
		puts
		puts
	end
end


