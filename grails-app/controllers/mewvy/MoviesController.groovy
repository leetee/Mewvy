package mewvy

import grails.plugins.rest.client.RestBuilder
import groovy.json.JsonSlurper
import mewvyUtils.theMovieDb


class MoviesController {

    static apiKey = "?api_key=af112ecdcf6eaa3f9d9b2496818f5462"
    static baseUrl = "http://api.themoviedb.org/3/"
    static moviesApi = "movie/"

    def index() {

    }

    def view() {

        def movie = theMovieDb.getMovie(params.id)

        def newMovie = new Movie(movie)
        newMovie.id = movie.id

        newMovie.videos = theMovieDb.getMovieVideos(params.id)

        def credits = theMovieDb.getMovieCredits(params.id)

        List<CastMember> cast = []
        credits.cast.each {
            def castMember = new CastMember(it)
            castMember.id = it.id
            cast.add(castMember)
        }
        newMovie.cast = cast

        def images = theMovieDb.getMovieImages(params.id)

        newMovie.backdrops = images.backdrops
        newMovie.posters = images.posters

        def allReviews = theMovieDb.getMovieReviews(params.id)

        List<Review> reviews = []
        allReviews.results.each {
            def review = new Review(it)
            reviews.add(review)
        }
        newMovie.reviews = reviews

        [movie : newMovie]
    }
}
