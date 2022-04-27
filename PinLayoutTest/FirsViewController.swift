//
//  FirsViewController.swift
//  PinLayoutTest
//
//  Created by Евгений Ганусенко on 4/27/22.
//

import UIKit
import PinLayout
import SwiftUI

class FirsViewController: UIViewController {

    var views: [UIView] = []

    let viewA = UIView()
    let viewB = UIView()
    let viewC = UIView()
    let viewD = UIView()
    let viewE = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        setupHierarchy()
        configireViews()
        layoutSubviews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func configureVC() {
        view.backgroundColor = .white
    }

    func setupHierarchy() {
        view.addSubview(viewA)
        view.addSubview(viewB)
        view.addSubview(viewC)
        view.addSubview(viewD)
        view.addSubview(viewE)
    }

    func configireViews() {
        viewA.backgroundColor = .systemBlue
        viewB.backgroundColor = .systemPink
        viewC.backgroundColor = .systemPurple
        viewD.backgroundColor = .magenta
        viewE.backgroundColor = .systemRed
        views = [viewA, viewB, viewC, viewD, viewE]
        views.forEach({ views in
            views.translatesAutoresizingMaskIntoConstraints = false
        })

    }

    func layoutSubviews() {

        viewA.pin.top(50).left(10).size(100)
        viewB.pin.top(50).right(10).size(100)
        viewC.pin.size(50)
        viewC.pin.horizontallyBetween(viewA, and: viewB, aligned: .top).marginHorizontal(30)
        viewD.pin.right(10).marginVertical(10).below(of: viewB).size(150)
        viewE.pin
            .horizontallyBetween(viewA, and: viewD)
            .marginHorizontal(20)
            .below(of: viewC)
            .marginVertical(20)
            //.width(100)
            .height(90)

    }
}

struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }

    struct ContainerView: UIViewControllerRepresentable {

        func makeUIViewController(context: UIViewControllerRepresentableContext<MyProvider.ContainerView>) -> FirsViewController {
            return FirsViewController() // твой экран
        }

        func updateUIViewController(_ uiViewController: MyProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MyProvider.ContainerView>) {
        }
    }
}
