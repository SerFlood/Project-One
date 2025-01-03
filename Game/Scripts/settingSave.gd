extends Node


var config = ConfigFile.new()
const SETTINGS_FILE_PATH = "user://settingsave.ini"


func _ready() -> void:
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		config.set_value("language", "english", "Eng")
		config.set_value("language", "russian", "Rus")
		
		config.save(SETTINGS_FILE_PATH)
	else:
		config.load(SETTINGS_FILE_PATH)
