import Foundation

struct NPCTile: Codable, Equatable {
	let id: UUID
	var npc: NPC

	init(id: UUID = UUID(), npc: NPC) {
		self.id = id
		self.npc = npc
	}
}

extension NPCTile {
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(npc, forKey: .npc)
	}

	enum CodingKeys: CodingKey {
		case id
		case npc
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(UUID.self, forKey: .id)
		self.npc = try container.decode(NPC.self, forKey: .npc)
	}
}
