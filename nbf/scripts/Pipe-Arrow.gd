extends TextureRect


signal beer_quality_changed(quality)


enum BeerQuality {
	POOR,
	BAD,
	NORMAL,
	GOOD,
	PERFECT
}


onready var min_energy_income = Values.V_ENERGY_SPEND_PER_SEC + Values.V_ENERGY_SPEND_PER_BOTTLE * 2
onready var max_energy_income = Values.V_ENERGY_SPEED_INCREASE_FROM_FUEL * 2


func _ready():
	self.rect_rotation = 0


func rot(deg):
	self.rect_rotation = deg


func _on_StatController_stat_changed(stat_idx, new_val):
	if stat_idx == 2:
		if new_val <= 1 && new_val >= -3:
			rot(0)
		elif new_val < -3 && new_val > min_energy_income:
			rot(45)
		elif new_val <= min_energy_income:
			rot(90)
		elif new_val > 1 && new_val < 3:
			rot(-45)
		elif new_val >= 3 && new_val < max_energy_income:
			rot(-90)
		elif new_val >= max_energy_income:
			rot(-270)
