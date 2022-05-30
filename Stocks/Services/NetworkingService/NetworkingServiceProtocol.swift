import Foundation

protocol NetworkingServiceProtocol {
	
	func getStocks(completion: @escaping (Result<[Stock], Error>) -> Void)
	func getQuote(symbol: String, completion: @escaping (Result<Quote, Error>) -> Void)
}
