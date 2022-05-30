import Foundation

struct RequestConfig<Parser> where Parser: ParserProtocol {
	let request: RequestProtocol
	let parser: Parser
}
