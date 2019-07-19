extends Position2D
var Velocidad= Vector2()
var gravedad=4000
var velocidad_mov=2500
var vel_salto=25000
var puede_saltar= false


func _physics_process(delta):
	Velocidad.y += gravedad*delta
	
	if(Input.is_action_pressed("tecla_a")):
		Velocidad.x = -velocidad_mov
		if(!get_node("Cuerpo_1/AnimationPlayer").is_playing() ) :
			get_node("Cuerpo_1/AnimationPlayer").play("corriendo")
			get_node("Cuerpo_1/Sprite_jug1").flip_h=false
	elif(Input.is_action_pressed("tecla_d")):
		if(!get_node("Cuerpo_1/AnimationPlayer").is_playing() ):
			get_node("Cuerpo_1/AnimationPlayer").play("corriendo")
			get_node("Cuerpo_1/Sprite_jug1").flip_h=true
			Velocidad.x= velocidad_mov
	else:
		Velocidad.x=0
		if(puede_saltar):
			get_node("Cuerpo_1/AnimationPlayer").play("corriendo")
		
	if(Input.is_action_pressed("tecla_z") && puede_saltar) :
		Velocidad.y = -vel_salto
		get_node("Cuerpo_1/AnimationPlayer").play("Saltando")
		puede_saltar= false
	var movimiento = Velocidad* delta
	get_node("Cuerpo_1").move_and_slide(movimiento)