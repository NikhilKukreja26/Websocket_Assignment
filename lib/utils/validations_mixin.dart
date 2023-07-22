mixin ValidationsMixin {
  String? validateWatchlistName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter watchlist name';
    } else {
      return null;
    }
  }
}
