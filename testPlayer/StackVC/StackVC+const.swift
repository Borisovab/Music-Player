//
//  StackVC+const.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import Foundation
import SnapKit

extension StackViewController {

    func setupConstraints() {
        view.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Singleton.StackViewControllerStackViewConstrains.top.rawValue)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY).offset(Singleton.StackViewControllerStackViewConstrains.bottom.rawValue)
        }
    }
}
