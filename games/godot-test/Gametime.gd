class_name Gametime

const REALTIME_SECONDS_TO_INGAME_MINUTES_RATIO = 50000

enum Season { SPRING, SUMMER, FALL, WINTER } # TODO: Replace with Season.gd
enum Weekday { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }
enum Daytime { NIGHT, EARLY_MORNING, LATE_MORNING, EARLY_AFTERNOON, LATE_AFTERNOON, EVENING }
enum Month { JANUARY, FEBRUARY, MARCH, APRIL, MAY, JUNE, JULY, AUGUST, SEPTEMBER, OCTOBER, NOVEMBER, DECEMBER }


const MINUTES_IN_HOUR := 60
const HOURS_IN_DAY := 24
const MINUTES_IN_DAY := HOURS_IN_DAY * MINUTES_IN_HOUR
const DAYS_IN_WEEK := 7
const DAYS_IN_MONTH := 28
const MONTHS_IN_YEAR := 12
const SEASONS_IN_YEAR := 4
const MONTHS_IN_SEASON := MONTHS_IN_YEAR / SEASONS_IN_YEAR
const MINUTES_IN_MONTH := MINUTES_IN_DAY * DAYS_IN_MONTH
const DAYS_IN_YEAR := DAYS_IN_MONTH * MONTHS_IN_YEAR
const MINUTES_IN_YEAR := DAYS_IN_YEAR * MINUTES_IN_DAY
const MINUTES_IN_SEASON := MINUTES_IN_MONTH * MONTHS_IN_SEASON

var _timestamp

var total_days: int:
	get:
		return floor(_timestamp / MINUTES_IN_DAY) as int
		
var daytime_hour: int:
	get:
		return int(floor(_timestamp / MINUTES_IN_HOUR)) % HOURS_IN_DAY
		
var daytime_minute: int:
	get:
		return int(_timestamp) % MINUTES_IN_HOUR

var daytime: int:
	get:
		return (int(floor(_timestamp / MINUTES_IN_HOUR)) % HOURS_IN_DAY) / 4
		
var weekday: int:
	get:
		return int(floor(_timestamp / MINUTES_IN_DAY)) % DAYS_IN_WEEK
		
var month_of_year: int:
	get:
		return int(_timestamp / MINUTES_IN_MONTH) % MONTHS_IN_YEAR

var season_of_year: int:
	get:
		return int(_timestamp / MINUTES_IN_SEASON) % SEASONS_IN_YEAR

var total_years: int:
	get:
		return int(_timestamp / MINUTES_IN_YEAR)

func _init(initial_timestamp = 0):
	_timestamp = initial_timestamp


func timestep_realtime(realtime_seconds):
	# THIS LEADS TO TIMESTAMP NOT BEING INTEGER
	_timestamp += realtime_seconds * REALTIME_SECONDS_TO_INGAME_MINUTES_RATIO


func timestep_gametime(ingame_minutes):
	_timestamp += ingame_minutes


# ---- REPRESENTATION ---- #


func get_pretty_string():
	var datetime_format = """Daytime: {hour}:{minute} - {daytime}
	Weekday: {weekday}
	Month: {month}
	Season: {season}
	Day of adventure: {day}
	Year of adventure: {year}
	"""
	return datetime_format.format({"day": total_days + 1, "hour": "%02d" % daytime_hour, "minute": "%02d" % daytime_minute, "daytime": Daytime.keys()[daytime].capitalize(), "weekday": Weekday.keys()[weekday].capitalize(), "month": Month.keys()[month_of_year].capitalize(), "season": Season.keys()[season_of_year].capitalize(), "year": total_years + 1})
