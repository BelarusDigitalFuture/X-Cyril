//
//  Binding.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation

public class Binding<T> {
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    public init(value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
