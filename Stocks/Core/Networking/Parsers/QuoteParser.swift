import Foundation

final class QuoteParser: ParserProtocol {
	
	typealias Model = Quote
	
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
