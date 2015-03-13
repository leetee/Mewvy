package mewvy

import grails.plugins.rest.client.RestBuilder
import groovy.json.JsonSlurper
import mewvyUtils.theMovieDb

class DiscoverController {

    static apiKey = "?api_key=af112ecdcf6eaa3f9d9b2496818f5462"
    static baseUrl = "http://api.themoviedb.org/3/"
    static moviesApi = "movie/"

    def index() {
        def popularUrl = baseUrl + moviesApi + "popular" + apiKey

        def rest = new RestBuilder()


        List<Movie> popularMovies = []

        def popularResponse = rest.get(popularUrl)
        def parsedPopularResponse = new JsonSlurper().parseText(popularResponse.responseEntity.body)

        parsedPopularResponse.results[0..12].each {

            def fullUrl = baseUrl + moviesApi + it.id + apiKey

            def fullResponse = rest.get(fullUrl)
            def parsedFullResponse = new JsonSlurper().parseText(fullResponse.responseEntity.body)

            def movie = new Movie(parsedFullResponse)
            movie.id = it.id
            popularMovies.add(movie)
        }

        // Get Credits for primary movie

        def creditsUrl = baseUrl + moviesApi + popularMovies[0].id + "/credits" + apiKey
        def creditResponse = rest.get(creditsUrl)
        def parsedCreditResponse = new JsonSlurper().parseText(creditResponse.responseEntity.body)

        List<CastMember> cast = []
        parsedCreditResponse.cast[0..4].each {

            def castMember = new CastMember(it)
            castMember.id = it.id
            cast.add(castMember)
        }

        popularMovies[0].cast = cast

        [popularMovies : popularMovies]
    }

    def search() {
        def query = params.query

        def results = theMovieDb.search(query)

        List<Movie> movieResults = []
        results.results.each {
            def movie = new Movie(it)
            movie.id = it.id
            movieResults.add(movie)
        }

        [results: movieResults]
    }
}
