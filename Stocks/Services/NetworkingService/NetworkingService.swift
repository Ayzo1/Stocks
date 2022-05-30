import Foundation

final class NetworkingService: NetworkingServiceProtocol {
	
	private var requestSender: RequestSenderProtocol?
	
	init() {
		guard let service: RequestSenderProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		requestSender = service
	}
	
	func getStocks(completion: @escaping (Result<[Stock], Error>) -> Void) {
		let parser = StockParser()
		let request = StocksRequest(page: 1)
		let requestConfig = RequestConfig(request: request, parser: parser)
		
		guard let requestSender = requestSender else {
			return
		}
		
		requestSender.send(requestConfig: requestConfig) { result in
			switch result {
			case .failure(let error):
				completion(.failure(error))
			case .success(let requestResult):
				completion(.success(requestResult as [Stock]))
			}
		}
	}
	
	func getQuote(symbol: String, completion: @escaping (Result<Quote, Error>) -> Void) {
		let parser = QuoteParser()
		let request = QuoteRequest(symbol: symbol)
		
		let requestConfig = RequestConfig(request: request, parser: parser)
		
		guard let requestSender = requestSender else {
			return
		}
		
		requestSender.send(requestConfig: requestConfig) { result in
			switch result {
			case .failure(let error):
				completion(.failure(error))
			case .success(let requestResult):
				completion(.success(requestResult as Quote))
			}
		}
	}
}
