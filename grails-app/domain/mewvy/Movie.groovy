package mewvy

class Movie {

    Boolean adult
    String backdrop_path
    Integer budget
    ArrayList genres
    String homepage
    Integer id
    String imdb_id
    String original_language
    String original_title
    String overview
    BigDecimal popularity
    String poster_path
    ArrayList production_companies
    ArrayList production_countries
    String release_date
    Integer revenue
    Integer runtime
    ArrayList spoken_languages
    String status
    String tagline
    String title
    String name
    Boolean video
    BigDecimal vote_average
    Integer vote_count
    List<CastMember> cast
    ArrayList videos
    ArrayList posters
    ArrayList backdrops
    List<Review> reviews

    static constraints = {
    }
}
