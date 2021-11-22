class_name Region

var Season = preload("Season.gd")
var seasons = Season.seasons
var Weather = preload("Weather.gd")

var name
var current_weather
var weather_likelihood_distribution # Each weight is the element's weight + the sum of all the preceding weights TODO: Don't make me do this manually

# Possibly define the weathers in here https://gamedev.stackexchange.com/questions/162976/how-do-i-create-a-weighted-collection-and-then-pick-a-random-element-from-it
# Include weather stability / rate of change
func _init(name, weather_likelihood_distribution):
	self.name = name
	self.weather_likelihood_distribution = weather_likelihood_distribution
	self.current_weather = update_weather()

func update_weather():
	pass
	
func pick_weighted_weather(season):
	pass
	
var region_plains = Region.new(
	"plains",
	{
		"spring": {
			Weather.new("cloudy", 5, 50, 40): 100
		},
		"summer": {
			Weather.new("sunny", 0, 50, 70): 200
		},
		"fall": {
			Weather.new("rain", 50, 50, 30): 300
		},
		"winter": {
			Weather.new("snow", 50, 50, 10): 400
		},
	}
)
