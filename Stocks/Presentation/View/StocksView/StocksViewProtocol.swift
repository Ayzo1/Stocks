import Foundation

protocol StocksViewProtocol: AnyObject {
	
	func reloadTable()
	func reloadCell(index: Int)
}
