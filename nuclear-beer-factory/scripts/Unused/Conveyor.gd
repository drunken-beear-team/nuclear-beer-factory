extends StaticBody2D


export(float) var _speed: float = 200



func _ready() -> void:
	constant_linear_velocity.x = _speed

