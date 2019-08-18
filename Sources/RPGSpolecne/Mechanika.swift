@propertyWrapper
final public class Mechanika<T> {
    private var value: T

    public var wrappedValue: T {
        get {
            print(value)
            return value
        }
        set {
            print(newValue)
            value = newValue
        }
    }

    public init(wrappedValue: T){
        value = wrappedValue
    }
}