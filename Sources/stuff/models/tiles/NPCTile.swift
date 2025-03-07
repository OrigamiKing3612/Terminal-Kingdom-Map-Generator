import Foundation

struct NPCTile: Codable, Equatable {
	let type: NPCTileType
	let canWalk: Bool
	let positionToWalkTo: TilePosition?

	init(type: NPCTileType, canWalk: Bool = false) {
		self.type = type
		self.canWalk = canWalk
		self.positionToWalkTo = nil
	}
}

extension NPCTile {
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(UUID(), forKey: .id)
		try container.encode(type, forKey: .tileType)
		try container.encode(canWalk, forKey: .canWalk)
		try container.encodeIfPresent(positionToWalkTo, forKey: .positionToWalkTo)
	}

	enum CodingKeys: CodingKey {
		case id
		case tileType
		case canWalk
		case positionToWalkTo
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(NPCTileType.self, forKey: .tileType)
		self.canWalk = try container.decode(Bool.self, forKey: .canWalk)
		self.positionToWalkTo = try container.decodeIfPresent(TilePosition.self, forKey: .positionToWalkTo)
	}
}
