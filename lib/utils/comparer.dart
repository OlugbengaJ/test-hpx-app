class Comparer {
  /// [Comparer] checks if two objects are exactly the same.
  ///
  /// To use, add extends on the class and invoke super on its constructor e.g.
  /// ```
  ///  class Device extends Comparer {
  ///    final String name;
  ///    bool enabled;
  ///
  ///    Device(this.name, this.enabled) : super(name);
  ///  }
  /// ```
  /// From example, Device classes are compared based on name.
  /// To compare based on a field of type class, endure the class extends comparer.
  const Comparer(this.v);

  /// [v] is the value used as comparison
  final dynamic v;

  @override
  bool operator ==(dynamic other) => other is Comparer && other.v == v;

  @override
  int get hashCode => v.hashCode;
}
