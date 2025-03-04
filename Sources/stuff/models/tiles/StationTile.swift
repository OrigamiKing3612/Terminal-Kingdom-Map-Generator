struct StationTile: Codable, Equatable {
	let type: StationTileType

	init(type: StationTileType) {
		self.type = type
	}
}

extension StationTile {
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(type, forKey: .tileType)
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(StationTileType.self, forKey: .tileType)
	}

	enum CodingKeys: CodingKey {
		case tileType
	}
}
