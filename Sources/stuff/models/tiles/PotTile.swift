struct PotTile: Codable, Equatable {
	let cropTile: CropTile

	init(cropTile: CropTile = .init(type: .none)) {
		self.cropTile = cropTile
	}
}

extension PotTile {
	enum CodingKeys: CodingKey {
		case cropTile
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(cropTile, forKey: .cropTile)
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.cropTile = try container.decode(CropTile.self, forKey: .cropTile)
	}
}
