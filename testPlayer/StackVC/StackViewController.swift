//
//  StackViewController.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import UIKit

class StackViewController: UIViewController {

    var songs = [Song]()
    var objectForNotification: Song!
    var stackPosition = 0

    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20.0
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Plist"
        
        setupConstraints()
        configureSongs()

        fillStack()

    }
}
