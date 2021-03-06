import Foundation

enum NetworkingError: Error {
	case couldNotParse
	case badURL
	case networkError
}

extension NetworkingError {
	public var description: String {
		switch self {
		case .badURL:
			return "could not create URL from string"
		case .couldNotParse:
			return "could not parse"
		case .networkError:
			return "failed to load data from API"
		}
	}
}
