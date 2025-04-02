import Foundation

struct NPCTile: Codable, Equatable {
	let id: UUID
	let startingVillageNPC: Bool = true
	let npcID: UUID

	init(id: UUID = UUID(), npc: NPC) {
		self.id = id
		self.npcID = npc.id
	}
}

extension NPCTile {
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(npcID, forKey: .npcID)
		try container.encode(startingVillageNPC, forKey: .startingVillageNPC)
	}

	enum CodingKeys: CodingKey {
		case id
		case npcID
		case startingVillageNPC
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(UUID.self, forKey: .id)
		self.npcID = try container.decode(UUID.self, forKey: .npcID)
	}
}
