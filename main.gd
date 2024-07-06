extends Control

@onready var dropdown = $dropdown
@onready var description = $Desc
@onready var skill = $Skills
@onready var file
@onready var jobs = {}
@onready var desc = {}
@onready var skills = {}   

func add_items(item):
	dropdown.add_item(item)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	import_resource_data()
	for n in jobs:
		add_items(jobs[n])

func import_resource_data():
	var file = FileAccess.open("res://Resource/jobs.csv", FileAccess.READ)
		
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		for i in data_set.size():
			if i == 1:
				jobs[jobs.size()] = data_set[i]
			elif i == 2:
				desc[desc.size()] = data_set[i]
			elif i == 3:
				skills[skills.size()] = data_set[i]
		
	file.close()



func _on_dropdown_item_selected(index):
	var current_selected = index
	
	match current_selected:
		0:
			description.text = "None"
			skill.text = "None"
		1:
			description.text = desc[1]
			skill.text = skills[1]
		2:
			description.text = desc[2]
			skill.text = skills[2]	
		3:
			description.text = desc[3]
			skill.text = skills[3]
