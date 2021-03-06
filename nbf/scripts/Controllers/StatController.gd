extends Node2D


signal stat_changed(stat_idx, new_val)


enum StatType {
	ENERGY,
	MONEY,
	ENERGY_DELTA,
}


class Stat:
	
	var max_val
	var cur_val

	func _init(max_val, cur_val = null) -> void:
		self.max_val = max_val
		if cur_val == null:
			self.cur_val = self.max_val
		else:
			self.cur_val = cur_val

	func set_val(new_val: int) -> int:
		if new_val > max_val:
			cur_val = max_val
			return new_val - max_val
		else:
			cur_val = new_val
			return 0

	func add_val(dt_val: int) -> int:
		return self.set_val(cur_val + dt_val)


# Money
var money = Stat.new(Values.V_MAX_MONEY, 0)

# Silo
var silo_queue = 0

# Energy staff
var energy = Stat.new(Values.V_MAX_ENERGY, 50)
var energy_in_fuze = Stat.new(Values.V_FUZE_CAP, 0)
onready var _cur_energy_delta: int = -Values.V_ENERGY_SPEND_PER_SEC
var _effecting_fuel_count: int = 0

## Timers
onready var energy_spend_timer: Timer = $EnergySpendTimer
onready var fuel_effect_timer: Timer = $FuelEffectTimer


func explode() -> void:
	if Values.GAME_MODE == "GOD":
		return
	var we = get_tree().get_current_scene().get_node("CanvasLayer/GUI/CanvasLayer/WhiteExplode")
	we.visible = true
	var eap = we.get_node("ExplotionAnimationPlayer")
	eap.play("Explode")


func _ready() -> void:
	energy_spend_timer.start(1)
	emit_signal("stat_changed", StatType.ENERGY, energy.cur_val)
	emit_signal("stat_changed", StatType.MONEY, money.cur_val)
	emit_signal("stat_changed", StatType.ENERGY_DELTA, _cur_energy_delta)


"""
This works something like this:
	1. You eat fuel
	2. You recive some income speed increase
	3. And also recive more effect time
	4. When this time ends, effect is gone
"""
func _on_FuelTankEater_eated(eatable_type):
	assert(eatable_type == EatableType.FUEL)
	if _effecting_fuel_count > 0:
		fuel_effect_timer.start(Values.V_ENERGY_FUEL_TIME_SEC + fuel_effect_timer.time_left)
	else:
		fuel_effect_timer.start(Values.V_ENERGY_FUEL_TIME_SEC)
	_effecting_fuel_count += 1
	_cur_energy_delta = -Values.V_ENERGY_SPEND_PER_SEC + Values.V_ENERGY_SPEED_INCREASE_FROM_FUEL * _effecting_fuel_count
	emit_signal("stat_changed", StatType.ENERGY_DELTA, _cur_energy_delta)


func _on_SpaceRocketEater_eated(eatable_type):
	pass # Replace with function body.

#  Change cur energy delta
func _on_EnergySpendTimer_timeout():
	var overflow_energy: int = 0
	if x:
		print(_cur_energy_delta - Values.V_ENERGY_SPEND_PER_BOTTLE)
		overflow_energy = energy.add_val(_cur_energy_delta - Values.V_ENERGY_SPEND_PER_BOTTLE)
	else:
		print(_cur_energy_delta)
		overflow_energy = energy.add_val(_cur_energy_delta)

	if energy.cur_val <= 0:
		explode()
	if overflow_energy > 0:
		var fuze_overflow: int = energy_in_fuze.add_val(overflow_energy)
		if fuze_overflow > 0:
			explode()
	emit_signal("stat_changed", StatType.ENERGY, energy.cur_val)
	energy_spend_timer.start(1)


func _on_FuelEffectTimer_timeout():
	_cur_energy_delta = -Values.V_ENERGY_SPEND_PER_SEC
	emit_signal("stat_changed", StatType.ENERGY_DELTA, _cur_energy_delta)
	_effecting_fuel_count = 0


func _on_SpaceRocket_earned_money(bottle_amount):
	money.add_val(Values.V_MONEY_FROM_ROCKET)
	emit_signal("stat_changed", StatType.MONEY, money.cur_val)


func _on_SankBuy_Button_button_down():
	if money.cur_val - Values.V_SANK_PRICE < 0:
		return
	money.add_val(-Values.V_SANK_PRICE)
	emit_signal("stat_changed", StatType.MONEY, money.cur_val)
	get_tree().get_current_scene().spawn_sank()


func _on_FuelBuy_Button_button_down():
	if money.cur_val - Values.V_FUEL_PRICE < 0:
		return
	money.add_val(-Values.V_FUEL_PRICE)
	emit_signal("stat_changed", StatType.MONEY, money.cur_val)
	get_tree().get_current_scene().spawn_fuel()

var x = false
func _on_Silo_poped_beer():
	x = true


func _on_Silo_finished_poped_beer():
	x = false
