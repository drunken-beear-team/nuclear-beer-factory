extends StaticBody2D


signal poped_beer()

export(Array) var _beers = []

var _cur_beer_count: int = 0


onready var silo_timer: Timer = $SiloTimer
onready var silo_eater = $SiloEater
onready var beer_spawn_node = $BeerSpawn
onready var bottles = get_tree().get_current_scene().get_node("Objects/Bottles")


func _pop_beer() -> void:
	emit_signal("poped_beer")
	var new_beer: Node2D = _beers[4].instance()
	new_beer.global_position = beer_spawn_node.global_position
	bottles.add_child(new_beer)


func _on_SiloEater_eated(eatable_type):
	assert(eatable_type == EatableType.SANK)
	silo_timer.start(Values.V_SILO_SPACING_SEC)
	silo_eater.visible = false


func _on_SiloTimer_timeout():
	_pop_beer()
	_cur_beer_count += 1
	if _cur_beer_count < Values.V_SILO_BOTTLES_IN_BATCH_COUNT:
		silo_timer.start(Values.V_SILO_SPACING_SEC)
	else:
		silo_eater.visible = true
		silo_timer.stop()
		_cur_beer_count = 0
