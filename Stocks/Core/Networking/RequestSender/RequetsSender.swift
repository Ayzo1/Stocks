import Foundation

final class RequestSender: RequestSenderProtocol {
	private let configuration: URLSessionConfiguration = .default
	private lazy var urlSession: URLSession = .init(configuration: configuration)
	
	func send<Parser>(requestConfig: RequestConfig<Parser>,
					  completionHandler: @escaping (Result<Parser.Model, Error>) -> Void) {
		
		guard let request = requestConfig.request.request else {
			completionHandler(.failure(NetworkingError.badURL))
			return
		}
		let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
			guard (response as? HTTPURLResponse)?.statusCode == 200,
				  let data = data,
				  error == nil
			else {
				completionHandler(.failure(NetworkingError.networkError))
				return
			}
			guard let parsedData = requestConfig.parser.parse(data: data) else {
				completionHandler(.failure(NetworkingError.couldNotParse))
				return
			}
			completionHandler(.success(parsedData))
		}
		dataTask.resume()
	}
}
