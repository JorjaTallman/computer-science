extends Node
@onready var points_label = %Label

var points = 0

func add_point():
	points += 10
	print(points)
	points_label.text = str(points)
	
func add100_points(): 
	points += 100
	print(points)
	points_label.text = str(points)

func add1000_points(): 
	points += 1000
	print(points)
	points_label.text = str(points)

