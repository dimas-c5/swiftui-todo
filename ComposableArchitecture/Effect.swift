import Combine

public struct Effect<Output>: Publisher {
    public typealias Failure = Never

    let publisher: AnyPublisher<Output, Failure>

    public func receive<S>(
        subscriber: S
    ) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        self.publisher.receive(subscriber: subscriber)
    }
}

extension Effect {
    public static func fireAndForget(work: @escaping () -> Void) -> Effect {
        Deferred { () -> Empty<Output, Never> in
            work()
            return Empty(completeImmediately: true)
        }.eraseToEffect()
    }

    public static func sync(work: @escaping () -> Output) -> Effect {
        Deferred {
            Just(work())
        }.eraseToEffect()
    }
}

extension Publisher where Failure == Never {
    public func eraseToEffect() -> Effect<Output> {
        .init(publisher: self.eraseToAnyPublisher())
    }
}
