import Foundation

struct NPC: Codable, Hashable, Equatable {
	let id: UUID
	let name: String
	let isStartingVillageNPC: Bool
	var hasTalkedToBefore: Bool
	var job: NPCJob?
	// skill level
	// let age: Int
	let gender: Gender
	let kingdomID: UUID?
	private(set) var positionToWalkTo: TilePosition?
	private(set) var attributes: [NPCAttribute] = []
	private var _hunger: Double = 100
	private var hunger: Hunger { Hunger.hunger(for: _hunger) }

	init(id: UUID = UUID(), name: String? = nil, gender: Gender? = nil, job: NPCJob? = nil, isStartingVillageNPC: Bool = false) {
		self.id = id
		self.gender = gender ?? Gender.allCases.randomElement()!
		self.name = name ?? Self.generateRandomName(for: self.gender)
		self.job = job
		self.isStartingVillageNPC = isStartingVillageNPC
		self.hasTalkedToBefore = false
		self.kingdomID = nil
	}

	static func generateRandomName(for gender: Gender) -> String {
		let maleNames = [
			"Adam", "Ben", "Caleb", "Daniel", "Eric",
			"Felix", "Greg", "Henry", "Isaac", "Jack",
			"Kyle", "Leo", "Matt", "Nate", "Owen",
			"Paul", "Quinn", "Ryan", "Sam", "Tom",
			"Victor", "Theo", "Jim", "Eli", "Mark",
		]

		let femaleNames = [
			"Anna", "Beth", "Chloe", "Daisy", "Emma",
			"Faith", "Grace", "Hannah", "Ivy", "Julia",
			"Kate", "Lily", "Mia", "Nora", "Olivia",
			"Paige", "Jordan", "Rachel", "Sarah", "Tessa",
			"Violet", "Wendy", "Zoey", "Ellie", "Claire",
		]

		return (gender == .male ? maleNames : femaleNames).randomElement()!
	}
}

enum Gender: String, Codable, CaseIterable {
	case male, female
}

enum NPCAttribute: Codable, CaseIterable {
	case needsAttention
}

enum Hunger: Codable, CaseIterable {
	case starving
	case hungry
	case could_eat
	case full

	var name: String {
		switch self {
			case .starving:
				"Starving"
			case .hungry:
				"Hungry"
			case .could_eat:
				"Could Eat"
			case .full:
				"Full"
		}
	}

	static func hunger(for hunger: Double) -> Hunger {
		switch hunger {
			case 0 ..< 25:
				.starving
			case 25 ..< 50:
				.hungry
			case 50 ..< 75:
				.could_eat
			case 75 ..< 100:
				.full
			default:
				.full
		}
	}
}
