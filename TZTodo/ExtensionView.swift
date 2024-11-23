//
//  ExtensionView.swift
//  TZTodo
//
//  Created by Дмитрий Трушин on 22/11/2024.
//

import UIKit

extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach(addSubview)
    }
}
