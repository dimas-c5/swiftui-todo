public func const<A, B>(_ a: A) -> (B) -> A {
    { _ in a}
}

// MARK: - KeyPaths

public func get<Root, Value>(_ keyPath: KeyPath<Root, Value>) -> (Root) -> Value {
    return { a in
        a[keyPath: keyPath]
    }
}

public func set<Root, Value>(_ keyPath: WritableKeyPath<Root, Value>, _ value: Value) -> (inout Root) -> Void {
    return { root in
        root[keyPath: keyPath] = value
    }
}

public func set<Root, Value>(_ keyPath: WritableKeyPath<Root, Value?>, _ value: Value?) -> (inout Root) -> Void {
    return { root in
        root[keyPath: keyPath] = value
    }
}

public func set<Root, Value>(_ keyPath: ReferenceWritableKeyPath<Root, Value>, _ value: Value) -> (Root) -> Void {
    return { root in
        root[keyPath: keyPath] = value
    }
}

public func set<Root, Value>(_ keyPath: ReferenceWritableKeyPath<Root, Value?>, _ value: Value?) -> (Root) -> Void {
    return { root in
        root[keyPath: keyPath] = value
    }
}

prefix operator ^

public prefix func ^ <Value>(_ value: Value) -> () -> Value {
    return { value }
}

extension KeyPath {
    @inline(__always)
    public static prefix func ^ (keyPath: KeyPath) -> (Root) -> Value {
        return get(keyPath)
    }
}
