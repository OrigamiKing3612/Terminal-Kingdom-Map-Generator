import Foundation

struct NPCTile: Codable, Equatable {
	let id: UUID
	let villageID: UUID
	let npcID: UUID

	private init(id: UUID = UUID(), npcID: UUID, villageID: UUID) {
		self.id = id
		self.npcID = npcID
		self.villageID = villageID
	}

	init(id: UUID = UUID(), npc: NPC, villageID: UUID) {
		self.id = id
		self.npcID = npc.id
		self.villageID = villageID
	}
}

extension NPCTile {
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(npcID, forKey: .npcID)
		try container.encode(villageID, forKey: .villageID)
	}

	enum CodingKeys: CodingKey {
		case id
		case npcID
		case villageID
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(UUID.self, forKey: .id)
		self.npcID = try container.decode(UUID.self, forKey: .npcID)
		self.villageID = try container.decode(UUID.self, forKey: .villageID)
	}
}
