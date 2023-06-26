//
//  Observable.swift
//  CountryList
//
//  Created by Nicol Warnakulasooriya on 22/06/23.
//

import Foundation

class Observable<T> {

    var value: T? {
        didSet {
            self.listner?(self.value)
        }
    }

    init(value: T?) {
        self.value = value
    }

    private var listner: ((T?) -> Void)?

    func bind(_ listner: @escaping ((T?) -> Void)) {
        listner(value)
        self.listner = listner
    }
}
