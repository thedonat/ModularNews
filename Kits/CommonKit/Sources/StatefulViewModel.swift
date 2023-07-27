//
//  StatefulViewModel.swift
//  CommonKit
//
//  Created by Burak Donat on 7/6/23.
//

import Foundation

public protocol StateChange {
}

open class StatefulViewModel<SC: StateChange>: BaseViewModel {

    public override init() {}
    public typealias StateChangeHandler = ((SC) -> Void)
    public var didAddChangeHandler: (() -> Void)?

    private var stateChangeHandlers: [StateChangeHandler] = [] {
        didSet {
            didAddChangeHandler?()
        }
    }

    public final func addChangeHandler(_ handler: @escaping StateChangeHandler) {
        stateChangeHandlers.append(handler)
    }

    public final func emit(change: SC) {
        stateChangeHandlers.forEach { (handler: StateChangeHandler) in
            handler(change)
        }
    }

    public final func clearChangeHandlers() {
        stateChangeHandlers.removeAll()
    }
}
