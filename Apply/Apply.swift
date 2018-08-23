//
//  Apply.swift
//  Apply
//
//  Created by Kristian Andersen on 23/08/2018.
//  Copyright © 2018 Kristian Andersen. All rights reserved.
//

import Foundation

precedencegroup ApplicativePrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
    lowerThan: NilCoalescingPrecedence
}

infix operator =>: ApplicativePrecedence

public func => <T>(lhs: T?, rhs: ((T) -> Void)?) {
    guard let lhs = lhs, let rhs = rhs else { return }
    rhs(lhs)
}

public func => <T>(lhs: ((T) -> Void)?, rhs: T?) {
    guard let lhs = lhs, let rhs = rhs else { return }
    lhs(rhs)
}

public func => <T, U>(lhs: T?, rhs: ((T) -> U?)?) -> U? {
    guard let lhs = lhs, let rhs = rhs else { return nil }
    return rhs(lhs)
}

public func => <T, U>(lhs: ((T) -> U?)?, rhs: T?) -> U? {
    guard let lhs = lhs, let rhs = rhs else { return nil }
    return lhs(rhs)
}

infix operator ~>: ApplicativePrecedence

public func ~> <T>(lhs: [T], rhs: (T) -> Void) {
    lhs.forEach(rhs)
}

public func ~> <T>(lhs: [T]?, rhs: (T) -> Void) {
    guard let lhs = lhs else { return }
    lhs.forEach(rhs)
}

public func ~> <T, U>(lhs: [T], rhs: (T) -> U) -> [U] {
    return lhs.map(rhs)
}

public func ~> <T, U>(lhs: [T]?, rhs: (T) -> U) -> [U]? {
    guard let lhs = lhs else { return nil }
    return lhs.map(rhs)
}
