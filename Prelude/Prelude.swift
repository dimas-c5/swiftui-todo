// MARK: - Identity
@inline(__always) public func id<A>(_ a: A) -> A {
    a
}

// MARK: - Const
@inline(__always) public func const<A, B>(_ a: A) -> (B) -> A {
    { _ in a }
}

// MARK: - Zip
public func zip<A, B>(_ a: A) -> (B) -> (A, B) {
    { b in (a, b) }
}

public func zip<A, B>(_ a: A?, _ b: B?) -> (A, B)? {
    guard let a = a, let b = b else { return nil }
    return (a, b)
}

// MARK: - KeyPaths
public func get<Root, Value>(_ keyPath: KeyPath<Root, Value>) -> (Root) -> Value {
    { $0[keyPath: keyPath] }
}

public func set<Root, Value>(_ keyPath: WritableKeyPath<Root, Value>, _ value: Value) -> (inout Root) -> Void {
    { $0[keyPath: keyPath] = value }
}

public func set<Root, Value>(_ keyPath: WritableKeyPath<Root, Value?>, _ value: Value?) -> (inout Root) -> Void {
    { $0[keyPath: keyPath] = value }
}

public func set<Root, Value>(_ keyPath: ReferenceWritableKeyPath<Root, Value>, _ value: Value) -> (Root) -> Void {
    { $0[keyPath: keyPath] = value }
}

public func set<Root, Value>(_ keyPath: ReferenceWritableKeyPath<Root, Value?>, _ value: Value?) -> (Root) -> Void {
    { $0[keyPath: keyPath] = value }
}

prefix operator ^

extension KeyPath {
    @inline(__always) public static prefix func ^ (keyPath: KeyPath) -> (Root) -> Value {
        get(keyPath)
    }
}

// MARK: - Tuples
public func first<A, B>(_ a: A, _ b: B) -> A {
    a
}

public func second<A, B>(_ a: A, _ b: B) -> B {
    b
}

public func swap<A, B>(_ a: A, _ b: B) -> (B, A) {
    (b, a)
}

// MARK: - Curry
public func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    { (a: A) -> (B) -> C in { (b: B) -> C in f(a, b) } }
}

public func curry<A, B, C, D>(_ f: @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    { (a: A) -> (B) -> (C) -> D in { (b: B) -> (C) -> D in { (c: C) -> D in f(a, b, c) } } }
}

public func curry<A, B, C, D, E>(_ f: @escaping (A, B, C, D) -> E) -> (A) -> (B) -> (C) -> (D) -> E {
    { (a: A) -> (B) -> (C) -> (D) -> E in { (b: B) -> (C) -> (D) -> E in { (c: C) -> (D) -> E in { (d: D) -> E in f(a, b, c, d) } } } }
}

// MARK: - Uncurry
public func uncurry<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (A, B) -> C {
    { a, b in f(a)(b) }
}

public func uncurry<A, B, C, D>(_ f: @escaping (A) -> (B) -> (C) -> D) -> (A, B, C) -> D {
    { a, b, c in f(a)(b)(c) }
}

public func uncurry<A, B, C, D, E>(_ f: @escaping (A) -> (B) -> (C) -> (D) -> E) -> (A, B, C, D) -> E {
    { a, b, c, d in f(a)(b)(c)(d) }
}

// MARK: - Flip
public func flip <A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
    { a in { b in f(b)(a) } }
}

// MARK: - Compose
public func compose<A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> (A) -> C {
    { a in f(g(a)) }
}
