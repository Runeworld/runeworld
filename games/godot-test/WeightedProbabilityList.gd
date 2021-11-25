class WeightedProbabilityListEntry:
	var item
	var accumulated_weight

	func _init(item, accumulated_weight):
		self.item = item
		self.accumulated_weight = accumulated_weight


var total_list_weight
var list


# TODO: Make _init() accept arbitrary number of item/weight pairs or whatever to avoid unnecessarily calling add_entry()
func _init():
	self.list = []
	self.total_list_weight = 0


func add_entry(item, weight):
	total_list_weight += weight
	list.append(WeightedProbabilityListEntry.new(item, total_list_weight))


func get_random():
	var rand_int = randi() % (total_list_weight + 1)
	for entry in list:
		if entry.accumulated_weight > rand_int:
			return entry.item
