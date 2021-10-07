extends MarginContainer


onready var GraphList = $VBoxContainer
export var min_margin_top := 10
export var min_margin_bottom := 10
export var min_margin_left := 10
export var min_margin_right := 10

func _ready() -> void:
	center()

func _on_MarginContainer_item_rect_changed() -> void:
	center()

func center() -> void:
	var current_size = rect_size
	var list_size = GraphList.rect_size
	if (current_size.x > list_size.x):
		var margin_width = (current_size.x - list_size.x) / 2
		add_constant_override("margin_right", max(margin_width, min_margin_right))
		add_constant_override("margin_left", max(margin_width, min_margin_left))
	if (current_size.y > list_size.y):
		var margin_height = (current_size.y - list_size.y) / 2
		add_constant_override("margin_top", max(margin_height, min_margin_top))
		add_constant_override("margin_bottom", max(margin_height, min_margin_bottom))
