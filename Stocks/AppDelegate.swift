//
//  AppDelegate.swift
//  Stocks
//
//  Created by ayaz on 11.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		window = UIWindow(frame: UIScreen.main.bounds)
		let navigationController = UINavigationController(rootViewController: StocksViewController())
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		
		registerDependencies()
		
		return true
	}
	
	private func registerDependencies() {
		let requestSender: RequestSenderProtocol = RequestSender()
		ServiceLocator.shared.register(service: requestSender)
		let networkingService: NetworkingServiceProtocol = NetworkingService()
		ServiceLocator.shared.register(service: networkingService)
	}
}

