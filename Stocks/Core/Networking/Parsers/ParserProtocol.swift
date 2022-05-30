import Foundation

protocol ParserProtocol {
	
	associatedtype Model
	
	func parse(data: Data) -> Model?
}
