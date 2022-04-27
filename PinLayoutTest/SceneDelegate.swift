//
//  SceneDelegate.swift
//  PinLayoutTest
//
//  Created by Евгений Ганусенко on 4/27/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }

        guard let windowSeane = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowSeane.coordinateSpace.bounds)
        window?.windowScene = windowSeane
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        configureNavigationBar()
    }

    func createFirstVC() -> UINavigationController {
        let firstVC = FirsViewController()
        firstVC.title = "FirsViewController"
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        return UINavigationController(rootViewController: firstVC)
    }

    func createSecondVC() -> UINavigationController {
        let secondVC = SecondViewController()
        secondVC.title = "SecondViewController"
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        return UINavigationController(rootViewController: secondVC)
    }

    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemPink
        tabBar.viewControllers = [createFirstVC(), createSecondVC()]

        return tabBar
    }

    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemPink
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}

