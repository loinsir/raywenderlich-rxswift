//
//  UIViewController+Rx.swift
//  Combinestagram
//
//  Created by 김인환 on 2022/04/30.
//  Copyright © 2022 Underplot ltd. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

extension UIViewController {
  func alert(title: String, description: String) -> Completable {
    return Completable.create { [weak self] observer in
      let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .default) { _ in
        observer(.completed)
      }
      alert.addAction(action)
      self?.present(alert, animated: true)
      return Disposables.create()
    }
  }
}
