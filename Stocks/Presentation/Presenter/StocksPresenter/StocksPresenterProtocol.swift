import Foundation

protocol StocksPresenterProtocol {
	
	var view: StocksViewProtocol? { get }
	
	func getStockName(for index: Int) -> String
	func getStockQuote(for index: Int) -> String
	func getStocksCount() -> Int
}
