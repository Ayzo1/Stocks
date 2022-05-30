import Foundation

final class QuoteRequest: RequestProtocol {
	
	var request: URLRequest?
	
	init(symbol: String) {
		guard let url = URL(string: "https://finnhub.io/api/v1/quote?symbol=\(symbol)&token=c9tt4qqad3i9vd5j94hg") else {
			return
		}
		self.request = .init(url: url)
	}
}
