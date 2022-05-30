import UIKit

class StocksViewController: UIViewController {

	var presenter: StocksPresenterProtocol?
	
	private lazy var stocksTable: UITableView = {
		let table = UITableView(frame: CGRect.zero, style: .insetGrouped)
		table.translatesAutoresizingMaskIntoConstraints = false
		table.register(StockTableViewCell.self, forCellReuseIdentifier: StockTableViewCell.identifirer)
		table.backgroundColor = Constants.backgroundColor
		return table
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter = StocksPresenter(view: self)
		stocksTable.delegate = self
		stocksTable.dataSource = self
		view.addSubview(stocksTable)
		setupTable()
		view.backgroundColor = Constants.backgroundColor
		setupNavigationBar()
    }
	
	private func setupNavigationBar() {
		navigationItem.title = "Stocks"
		navigationController?.navigationBar.barTintColor = Constants.secondBackgroundColor
		navigationController?.navigationBar.backgroundColor = Constants.secondBackgroundColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Constants.textColor]
	}
	
	private func setupTable() {
		stocksTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		stocksTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		stocksTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		stocksTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		//stocksTable.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
		//stocksTable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
	}
}

extension StocksViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.getStocksCount() ?? 0;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = stocksTable.dequeueReusableCell(withIdentifier: StockTableViewCell.identifirer) as? StockTableViewCell else {
			return UITableViewCell()
		}
		let name = presenter?.getStockName(for: indexPath.row)
		let quote = presenter?.getStockQuote(for: indexPath.row) ?? "no price"
		cell.configurateCell(generalText: name ?? "No", secondaryText: "\(quote)$")
		return cell
	}
}

extension StocksViewController: StocksViewProtocol {
	
	func reloadTable() {
		DispatchQueue.main.async { [weak self] in
			self?.stocksTable.reloadData()
		}
	}
	
	func reloadCell(index: Int) {
		DispatchQueue.main.async { [weak self] in
			let indexPath = IndexPath(row: index, section: 0)
			self?.stocksTable.beginUpdates()
			self?.stocksTable.reloadRows(at: [indexPath], with: .automatic)
			self?.stocksTable.endUpdates()
		}
	}
}
