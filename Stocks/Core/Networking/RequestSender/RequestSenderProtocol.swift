import Foundation

protocol RequestSenderProtocol {
	
	func send<Parser>(requestConfig: RequestConfig<Parser>,
					  completionHandler: @escaping (Result<Parser.Model, Error>) -> Void)
}
