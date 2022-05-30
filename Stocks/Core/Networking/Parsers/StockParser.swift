import Foundation

final class StockParser: ParserProtocol {
	
	typealias Model = [Stock]
	
	func parse(data: Data) -> Model? {
		do {
			let decoder = JSONDecoder()
			let parsedData = try decoder.decode(Model.self, from: data)
			return parsedData
		} catch {
			return nil
		}
	}
}
