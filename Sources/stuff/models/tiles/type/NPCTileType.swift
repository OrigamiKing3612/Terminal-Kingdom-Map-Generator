enum NPCJob: Codable, Hashable, Equatable {
	case blacksmith
	case blacksmith_helper
	case miner
	case mine_helper
	case carpenter
	case carpenter_helper
	case farmer
	case farmer_helper

	case king
	case salesman(type: SalesmanType)
	case builder
	case builder_helper
	case hunter
	case inventor
	case stable_master
	case doctor
	case chef
	case potter
}

enum SalesmanType: Codable {
	case buy, sell, help
}
