class_name Game extends Control

var Gametime = preload("Gametime.gd")

@onready var time_and_date_label = $TimeAndDateLabel
@onready var weather_label = $WeatherLabel

var current_time = Gametime.new()

# Only manipulate data here, do not display it
func update_gamestate(time_delta):
	current_time.timestep_realtime(time_delta)


# Do not manipulate data here, only hand it over to nodes to be displayed
func update_visuals():
	time_and_date_label.text = current_time.get_pretty_string()
	weather_label.text = "weather label"

# Called every frame with delta = frametime
func _process(delta):
	update_gamestate(delta)
	update_visuals()
