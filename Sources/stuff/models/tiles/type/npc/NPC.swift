import Foundation

struct NPC: Codable, Hashable, Equatable {
	let id: UUID
	let name: String
	let isStartingVillageNPC: Bool
	var hasTalkedToBefore: Bool
	var job: NPCJob?
	// let age: Int
	let gender: Gender
	private(set) var positionToWalkTo: TilePosition?
	private(set) var attributes: [NPCAttribute] = []

	init(id: UUID = UUID(), name: String? = nil /* , age: Int? = nil */, gender: Gender? = nil, job: NPCJob? = nil, isStartingVillageNPC: Bool = false, positionToWalkTo: TilePosition? = nil) {
		self.id = id
		self.gender = gender ?? Gender.allCases.randomElement()!
		self.name = name ?? Self.generateRandomName(for: self.gender)
		// self.age = age ?? Int.random(in: 18 ... 80)
		self.job = job
		self.isStartingVillageNPC = isStartingVillageNPC
		self.hasTalkedToBefore = false
		self.positionToWalkTo = positionToWalkTo
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
