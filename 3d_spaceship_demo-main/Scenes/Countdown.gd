extends Control

export (int) var minutes = 05
export (int) var seconds
var dseconds = 10

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if minutes < 10:
		$Min.set_text("0"+str(minutes))
	else:
		$Min.set_text(str(minutes))
	if seconds < 10:
		$Sec.set_text("0"+str(seconds))
	else:
		 $Sec.set_text(str(seconds))
	if dseconds < 10:
		$DSec.set_text("0"+str(dseconds))
	else:
		$DSec.set_text(str(dseconds))

func _physics_process(_delta):
	if dseconds < 0:
		seconds -= 1
		dseconds =10
	if seconds < 1:
		minutes -= 1
		seconds = 59
	if minutes < 10:
		$Min.set_text("0"+str(minutes))
	else:
		$Min.set_text(str(minutes))
	if seconds < 10:
		$Sec.set_text("0"+str(seconds))
	else:
		$Sec.set_text(str(seconds))
	if dseconds < 10:
		$DSec.set_text("0"+str(dseconds))
	else:
		$DSec.set_text(str(dseconds))
	if minutes == 0 and seconds == 0 and dseconds == 0:
		$Timer.stop()
		
func _on_Timer_timeout():
	dseconds -= 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
