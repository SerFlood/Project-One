extends Node

var save_dict = {
	"game_entries": 0
}

func _ready() -> void:
	load_game()
	save_dict["game_entries"] += 1
	save_game()
	print("Количество заходов в игру: ", save_dict["game_entries"])

func save_game():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	if save_file == null:
		print("Не удалось открыть файл для записи.")
		return

	var json_string = JSON.stringify(save_dict)
	save_file.store_line(json_string)
	save_file.close()

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	if save_file == null:
		print("Не удалось открыть файл для чтения.")
		return

	var json_string = save_file.get_line()
	var json = JSON.new()
	
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		print("Ошибка парсинга JSON: ", json.get_error_message(), " в ", json_string, " на строке ", json.get_error_line())
		return
	
	save_dict = json.get_data()
	save_file.close()
