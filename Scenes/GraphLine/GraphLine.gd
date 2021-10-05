tool
extends HBoxContainer


export(Enums.Transition) var transition_type = Enums.Transition.TRANS_CUBIC setget set_transition

onready var graphs := [
	$InContainer/GraphIn,
	$OutContainer/GraphOut,
	$InOutContainer/GraphInOut,
	$OutInContainer/GraphOutIn
]

onready var LineLabel = $MarginContainer/LineLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LineLabel.text = transition_to_string(transition_type)
	if not Engine.editor_hint:
		for graph in graphs:
			graph.transition_type = transition_type
			graph.calculate()

func set_transition(trans: int) -> void:
	transition_type = trans
	if is_instance_valid(LineLabel):
		LineLabel.text = transition_to_string(transition_type)

func transition_to_string(n: int) -> String:
	match n:
		Enums.Transition.TRANS_LINEAR:
			return "Linear"
		Enums.Transition.TRANS_SINE:
			return "Sine"
		Enums.Transition.TRANS_QUINT:
			return "Quint"
		Enums.Transition.TRANS_QUART:
			return "Quart"
		Enums.Transition.TRANS_QUAD:
			return "Quad"
		Enums.Transition.TRANS_EXPO:
			return "Expo"
		Enums.Transition.TRANS_ELASTIC:
			return "Elastic"
		Enums.Transition.TRANS_CUBIC:
			return "Cubic"
		Enums.Transition.TRANS_CIRC:
			return "Circ"
		Enums.Transition.TRANS_BOUNCE:
			return "Bounce"
		Enums.Transition.TRANS_BACK:
			return "Back"
		_:
			return ""
