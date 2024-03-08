abstract class Enum<T> {
  const Enum(this._value);
  final T _value;

  T get value => _value;

  @override
  String toString() => 'Enum(${T.runtimeType})> value: $value';
}
