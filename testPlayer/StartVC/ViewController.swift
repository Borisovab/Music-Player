//
//  ViewController.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createNavigationController()
    }

    private func createNavigationController() {
        let rootVC: UIViewController = StackViewController()
        rootVC.title = "Stack of Music"

        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false)
    }

}

