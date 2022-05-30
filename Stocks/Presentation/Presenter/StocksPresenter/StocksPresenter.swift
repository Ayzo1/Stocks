import Foundation

final class StocksPresenter: StocksPresenterProtocol {
	
	// MARK: - Private properties
	
	private var networkingService: NetworkingServiceProtocol?
	private var stocks: [Stock]?
	
	// MARK: - Properties
	
	weak var view: StocksViewProtocol?
	
	// MARK: - Init
	
	init(view: StocksViewProtocol) {
		self.view = view
		guard let service: NetworkingServiceProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		networkingService = service
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
	
	// MARK: - StocksPresenterProtocol
	
	func getStockName(for index: Int) -> String {
		guard let stocks = stocks else {
			return ""
		}
		return stocks[index].description
	}
	
	func getStockQuote(for index: Int) -> String {
		guard let stocks = stocks else {
			return ""
		}
		let symbol = stocks[index].symbol
		networkingService?.getQuote(symbol: symbol) { result in
			switch result {
			case .failure(let error):
				print(error.localizedDescription)
			case .success(let quote):
				print(quote.currentPrice)
			}
		}
		return ""
	}
	
	// MARK: - Private methods
}
