import Foundation

final class StocksRequest: RequestProtocol {
	var request: URLRequest?
	
	init(page: Int) {
		guard let url = URL(string: "https://finnhub.io/api/v1/stock/symbol?exchange=US&page=1&token=c9tt4qqad3i9vd5j94hg") else {
			return
		}
		self.request = .init(url: url)
	}
}
