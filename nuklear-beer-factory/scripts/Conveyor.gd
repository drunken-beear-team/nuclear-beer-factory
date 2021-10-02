extends StaticBody2D


export(float) var _speed


func _ready():
	constant_linear_velocity.x = _speed


func _process(delta):
	$Sprite.texture.region.position.x += -(_speed) * delta
