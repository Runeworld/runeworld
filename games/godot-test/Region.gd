class_name Region

var WeightedProbabilityList = preload("WeightedProbabilityList.gd")
var Season = preload("Season.gd")
var seasons = Season.seasons
var Weather = preload("Weather.gd")

var name
var current_weather
var weather_likelihood_distribution


# Include weather stability / rate of change
func _init(name, weather_likelihood_distribution):
	self.name = name
	self.weather_likelihood_distribution = weather_likelihood_distribution
	self.current_weather = update_weather()


func update_weather():
	pass


var region_plains = Region.new(
	"plains",
	WeightedProbabilityList.new().add_entry(Weather.new("cloudy", 5, 50, 40), 100).add_entry(
		Weather.new("sunny", 0, 50, 70), 200
	)
)
