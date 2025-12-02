extends OptionButton

export (String,"slot","equipment","hardpoint","alignments") var list_type = "slot"

export var vanilla_slot_types = [
	"HARDPOINT",
	"MASS_DRIVER_AMMUNITION",
	"NANODRONE_STORAGE",
	"PROPELLANT_TANK",
	"STANDARD_REACTION_CONTROL_THRUSTERS",
	"STANDARD_MAIN_ENGINE",
	"FISSION_RODS",
	"ULTRACAPACITOR",
	"FISSION_TURBINE",
	"AUX_POWER_SLOT",
	"CARGO_BAY",
	"AUTOPILOT",
	"HUD",
	"LIDAR",
	"RECON_DRONE",
]
export var vanilla_equipment_types = [
	# Weapon tools
	"EQUIPMENT_MASS_DRIVERS",
	"EQUIPMENT_PLASMA_THROWERS",
	"EQUIPMENT_PLASMA_THROWERS_HEAVY",
	"EQUIPMENT_MANIPULATION_ARMS",
	"EQUIPMENT_TURRETS",
	"EQUIPMENT_NANODRONES",
	"EQUIPMENT_IRON_THROWERS",
	"EQUIPMENT_MINING_LASERS",
	"EQUIPMENT_MICROWAVES",
	"EQUIPMENT_SYNCHROTRONS",
	
	# Cradled equipment
	"EQUIPMENT_CARGO_CONTAINER",
	"EQUIPMENT_MINING_COMPANION",
	"EQUIPMENT_IMPACT_ABSORBER",
	"EQUIPMENT_BEACON",

	# Non-hardpoint equipment
	"CONSUMABLE_MASS_DRIVER_AMMUNITION",
	"CONSUMABLE_NANODRONES",
	"CONSUMABLE_PROPELLANT",
	"THRUSTER_STANDARD_REACTION_CONTROL_THRUSTERS",
	"THRUSTER_STANDARD_MAIN_ENGINE",
	"POWER_FISSION_RODS",
	"POWER_ULTRACAPACITOR",
	"POWER_FISSION_TURBINE",
	"POWER_AUX_POWER_SLOT",
	"CARGO_BAY",
	"COMPUTER_AUTOPILOT",
	"COMPUTER_HUD",
	"SENSOR_LIDAR",
	"SENSOR_RECON_DRONE",
]

export var vanilla_hardpoint_types = [
	# Hardpoint slots
	"HARDPOINT_LOW_STRESS", # - Any low-stress hardpoint
	"HARDPOINT_HIGH_STRESS", # - Any high-stress hardpoint
	"HARDPOINT_SPINAL", # - Any spinal hardpoint
	"HARDPOINT_DOCKING_BAY", # - A docking-bay type hardpoint
	"HARDPOINT_DRONE_POINT", # - A drone hardpoint
]

export var vanilla_alignments = [
	# Equipment alignment
	"ALIGNMENT_LEFT", # - Any left hardpoint
	"ALIGNMENT_RIGHT", # - Any right hardpoint
	"ALIGNMENT_CENTER", # - Any central hardpoint
]

var alignments = []
var hardpoint_types = []
var equipment_types = []
var slot_types = []

func _ready():
	Settings.connect("settings_changed",self,"reset_options")
	connect("item_selected",self,"item_selected")
	connect("item_focused",self,"item_selected")
	fetch()

onready var last_selected_drivers = Settings.get_value("drivers","references")

func reset_options(data):
	var value = data.get("drivers",{}).get("references",[])
	
	if hash(value) != hash(last_selected_drivers):
		last_selected_drivers = value
		fetch()
		

func item_selected(i):
	var arr = get_data()
	var selection = arr[i]
	var line = get_parent().get_node_or_null("LineEdit")
	if line:
		line.text = selection

func get_data():
	var arr = []
	match list_type:
		"slot":
			arr = slot_types
		"equipment":
			arr = equipment_types
		"hardpoint":
			arr = hardpoint_types
		"alignments":
			arr = vanilla_alignments
	return arr

var file = File.new()

func fetch():
	clear()
	slot_types = vanilla_slot_types.duplicate()
	equipment_types = vanilla_equipment_types.duplicate()
	hardpoint_types = vanilla_hardpoint_types.duplicate()
	alignments = vanilla_alignments.duplicate()
	
	for item in last_selected_drivers:
		if file.file_exists(item):
			var data = load(item).get_script_constant_map()
			var ends = item.split("/")[item.split("/").size() - 1]
			match ends:
				"EQUIPMENT_TAGS.gd":
					var id = data.get("EQUIPMENT_TAGS",{})
					if "slot_types" in id:
						slot_types.append_array(id["slot_types"])
					if "equipment_types" in id:
						equipment_types.append_array(id["equipment_types"])
					if "alignments" in id:
						alignments.append_array(id["alignments"])
					if "hardpoint_types" in id:
						hardpoint_types.append_array(id["hardpoint_types"])
				"NODE_DEFINITIONS.gd":
					pass
				"WEAPONSLOT_SHIP_TEMPLATES.gd":
					pass
				"WEAPONSLOT_MODIFY_TEMPLATES.gd":
					pass
			
#			breakpoint
	
	var arr = get_data()
	for i in arr:
		add_item(i)
