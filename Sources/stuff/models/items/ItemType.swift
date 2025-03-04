enum ItemType: Codable, Equatable, Hashable {
	// MARK: Weapons

	case sword, axe(type: AxeItem), pickaxe(type: PickaxeItem), boomerang // bow? net? dagger?

	// MARK: Armor?

	case backpack(type: BackpackItem) // TODO: DO BACKPACK

	// MARK: Food

	// MARK: Materials

	case lumber // plank?
	case iron
	case coal
	case gold
	case stone
	case clay
	case tree_seed
	case stick
	case steel

	// MARK: Buildings

	case door(tile: DoorTile)
	case fence
	case gate
	case chest /* (tile: ChestTile) */
	case bed
	case desk

	// MARK: Other

	case coin

	// MARK: Crops

	case carrot
	case potato
	case wheat
	case lettuce

	var isBuildable: Bool {
		switch self {
			case .door, .fence, .gate, .lumber, .chest, .bed, .desk: true
			default: false
		}
	}
}

enum BackpackItem: Codable, Equatable {
	case small, medium, large

	var inventoryName: String {
		switch self {
			case .small: "Small"
			case .medium: "Medium"
			case .large: "Large"
		}
	}
}
