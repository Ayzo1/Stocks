import UIKit

class StocksViewController: UIViewController {

	var presenter: StocksPresenterProtocol?
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter = StocksPresenter(view: self)
		view.backgroundColor = .cyan
    }
	
	
}

extension StocksViewController: StocksViewProtocol {
	
	func reloadTable() {
		DispatchQueue.main.async {
			
		}
	}
}
