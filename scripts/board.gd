class_name Board extends Node

@export var tetromino_scene: PackedScene

func spawn_tetromino(type: Shared.TetrominoType, is_next_piece: bool, spawn_position: Vector2):
	var tetromino_data: Resource = Shared.data[type]
	var tetromino = tetromino_scene.instantiate() as Tetromino
	
	tetromino.is_next_piece = is_next_piece
	tetromino.tetromino_data = tetromino_data
	
	if not is_next_piece:
		tetromino.position = spawn_position
		add_child(tetromino)
