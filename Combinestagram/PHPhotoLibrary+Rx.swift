//
//  PHPhotoLibrary+Rx.swift
//  Combinestagram
//
//  Created by 김인환 on 2022/04/30.
//  Copyright © 2022 Underplot ltd. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension PHPhotoLibrary {
  static var authorized: Observable<Bool> {
    return Observable.create { observer in
      if #available(iOS 14.0, *) {
        DispatchQueue.main.async {
          if authorizationStatus() == .authorized {
            observer.onNext(true)
            observer.onCompleted()
          } else {
            observer.onNext(false)
            requestAuthorization { newStatus in
              observer.onNext(newStatus == .authorized)
              observer.onCompleted()
            }
        } }
      } else {
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }
}
