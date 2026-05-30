extension DistanceUtils on num {
  String toApproximately() {
    return this < 1000
        ? '${toStringAsFixed(2)} m'
        : '${(this / 1000).toStringAsFixed(2)} km';
  }
}
