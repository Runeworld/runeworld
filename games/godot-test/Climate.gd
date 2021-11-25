class_name Climate

var name: String
var weather_likelihood_distribution: Dictionary


func _init(name, weather_likelihood_distribution, temperature_likelihood_distribution):
	self.name = name
	self.weather_likelihood_distribution = weather_likelihood_distribution
