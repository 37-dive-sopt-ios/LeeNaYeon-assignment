//
//  BaeminTabbar.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class BaeminTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .baeminWhite
        
        setViewController()
        setViewControllerAppearance()
    }
    
    private func setViewController() {
        
        let homeViewController = BaeminFeedViewController()
        let shoppingViewController = ShoppingViewController()
        let heartViewController = HeartViewController()
        let historyViewController = HistoryViewController()
        let myPageViewController = MyPageViewController()
        
        self.viewControllers = [
            createViewController(
                for: homeViewController,
                title: "홈",
                imageName: .home
            ),
            createViewController(
                for: shoppingViewController,
                title: "장보기·쇼핑",
                imageName: .cart
            ),
            createViewController(
                for: heartViewController,
                title: "찜",
                imageName: .heart
            ),
            createViewController(
                for: historyViewController,
                title: "주문 내역",
                imageName: .order
            ),
            createViewController(
                for: myPageViewController,
                title: "마이배민",
                imageName: .face
            ),
        ]
    }
    
    private func setViewControllerAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .baeminWhite
        appearance.shadowColor = .clear

        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = .baeminGray700
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.baeminGray700,
            .font: FontManager.bodyR10.font
        ]
        
        itemAppearance.selected.iconColor = .baeminBlack
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.baeminBlack,
            .font: FontManager.titleSb10.font
        ]
        
        appearance.stackedLayoutAppearance = itemAppearance
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func createViewController(for rootViewController: UIViewController,
                                      title: String,
                                      imageName: UIImage) -> UIViewController {
        let viewController = UINavigationController(rootViewController: rootViewController)
        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = imageName.withRenderingMode(.alwaysTemplate)
        return viewController
    }
}
