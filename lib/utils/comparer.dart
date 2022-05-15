class Comparer {
  /// [Comparer] checks if two objects are exactly the same.
  const Comparer(this.v);

  /// [v] is the value used as comparison
  final dynamic v;

  @override
  bool operator ==(dynamic other) => other is Comparer && other.v == v;

  @override
  int get hashCode => v.hashCode;
}
