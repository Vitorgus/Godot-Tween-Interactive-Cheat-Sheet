extends Control

onready var lines := [
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/LinearLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer/ExpoLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer/QuadLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer/CubicLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer/QuartLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer/QuintLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer2/SineLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer2/CircLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer2/ElasticLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer2/BounceLine,
	$CenterContainer/VBoxContainer2/ScrollContainer/CenterMargin/VBoxContainer/HBoxContainer/VBoxContainer2/BackLine
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_Timer_timeout() -> void:
	for line in lines:
		line.calculate_graphs()
	$Label.visible = false
	$CenterContainer.visible = true
