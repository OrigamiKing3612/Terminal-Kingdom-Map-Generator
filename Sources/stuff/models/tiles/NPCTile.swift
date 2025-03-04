struct NPCTile: Codable, Equatable {
	let type: NPCTileType

	init(type: NPCTileType) {
		self.type = type
	}
}

extension NPCTile {
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(type, forKey: .tileType)
	}

	enum CodingKeys: CodingKey {
		case tileType
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(NPCTileType.self, forKey: .tileType)
	}
}
