import Foundation

final class StocksPresenter: StocksPresenterProtocol {
	
	// MARK: - Private properties
	
	private var networkingService: NetworkingServiceProtocol?
	private var stocks: [Stock]?
	private var quotes = [Int: Quote]()
	
	// MARK: - Properties
	
	weak var view: StocksViewProtocol?
	
	// MARK: - Init
	
	init(view: StocksViewProtocol) {
		self.view = view
		guard let service: NetworkingServiceProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		networkingService = service
		downloadStocks()
	}
	
	// MARK: - StocksPresenterProtocol
	
	func getStocksCount() -> Int {
		return stocks?.count ?? 0
	}
	
	func getStockName(for index: Int) -> String {
		guard let stocks = stocks else {
			return ""
		}
		return stocks[index].description
	}
	
	func getStockQuote(for index: Int) -> String {
		guard let quote = quotes[index] else {
			downloadQuote(index: index)
			return ""
		}
		return String(quote.currentPrice)
	}
	
	// MARK: - Private methods
	
	private func downloadQuote(index: Int) {
		guard let stocks = stocks else {
			return
		}
		let symbol = stocks[index].symbol
		networkingService?.getQuote(symbol: symbol) { [weak self] result in
			switch result {
			case .failure(let error):
				print(error.localizedDescription)
			case .success(let quote):
				self?.quotes[index] = quote
				self?.view?.reloadCell(index: index)
			}
		}
	}
	
	private func downloadStocks() {
		networkingService?.getStocks() { [weak self] result in
			switch result {
			case .failure(let error):
				print(error.localizedDescription)
			case .success(let stocks):
				self?.stocks = stocks
				self?.view?.reloadTable()
			}
		}
	}
}
