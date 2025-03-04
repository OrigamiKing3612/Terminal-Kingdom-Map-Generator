import Foundation

struct DoorTile: BuildableTile, Hashable {
	let type: DoorTileTypes
	let isPartOfPlayerVillage: Bool
	let isPlacedByPlayer: Bool
	private(set) var level: Int
	var hasCustomMap: Bool { isPlacedByPlayer }

	init(type: DoorTileTypes, isPartOfPlayerVillage: Bool = false, isPlacedByPlayer: Bool = false) {
		self.type = type
		self.isPartOfPlayerVillage = isPartOfPlayerVillage
		self.level = 1
		self.isPlacedByPlayer = isPlacedByPlayer
	}
}

extension DoorTile {
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(DoorTileTypes.self, forKey: .tileType)
		self.isPartOfPlayerVillage = try container.decode(Bool.self, forKey: .isPartOfPlayerVillage)
		self.isPlacedByPlayer = try container.decode(Bool.self, forKey: .isPlacedByPlayer)
		self.level = try container.decode(Int.self, forKey: .level)
	}

	enum CodingKeys: CodingKey {
		case tileType
		case isPartOfPlayerVillage
		case isPlacedByPlayer
		case level
	}

	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(type, forKey: .tileType)
		try container.encode(isPartOfPlayerVillage, forKey: .isPartOfPlayerVillage)
		try container.encode(isPlacedByPlayer, forKey: .isPlacedByPlayer)
		try container.encode(level, forKey: .level)
	}
}
