import Foundation

struct Quote: Codable {
	
	let currentPrice: Double
	let change: Double
	let percentChange: Double
	let highPrice: Double
	let lowPrice: Double
	let openPrice: Double
	let previousClosePrice: Double
	
	enum CodingKeys: String, CodingKey {
		case currentPrice = "c"
		case change = "d"
		case percentChange = "dp"
		case highPrice = "h"
		case lowPrice = "l"
		case openPrice = "o"
		case previousClosePrice = "pc"
	}
}
