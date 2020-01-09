import Combine
import Prelude

extension Publisher where Output == Never, Failure == Never {
    public func fireAndForget<A>() -> Effect<A> {
        map(absurd).eraseToEffect()
    }
}
