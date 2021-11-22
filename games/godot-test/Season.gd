class_name Season

var name: String
var seasons:
	get:
		return seasons
	set(value):
		pass # TODO: Debugging

func _init(name):
	self.name = name
	self.seasons = {
		'spring': Season.new('spring'),
		'summer': Season.new('summer'),
		'fall': Season.new('fall'),
		'winter': Season.new('winter'),
	}
