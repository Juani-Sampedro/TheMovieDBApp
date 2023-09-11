abstract class IGenreRepository<T> {
  Future<T> getData();

  T getNameFromIds(
    List<int> genresIds,
    T genres,
  );
}
