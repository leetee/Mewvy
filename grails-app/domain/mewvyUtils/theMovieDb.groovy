package mewvyUtils

import grails.plugins.rest.client.RestBuilder
import groovy.json.JsonSlurper

public class theMovieDb {

    public static String apiKey   = "?api_key=af112ecdcf6eaa3f9d9b2496818f5462"
    public static String baseUrl  = "http://api.themoviedb.org/3/"
    public static String movie    = "movie/"
    public static String videos    = "/videos"
    public static String credits    = "/credits"
    public static String images    = "/images"
    public static String reviews    = "/reviews"
    public static String multiSearch    = "search/multi"
    public static String movieSearch    = "search/movie"

// TODO: Add Error Handling

    def static callApi(params, url) {

        def rest = new RestBuilder()

        String fullUrl = baseUrl + url + apiKey
        if(params) fullUrl = fullUrl + params

        def response = rest.get(fullUrl)

        def parsedResponse = new JsonSlurper().parseText(response.responseEntity.body)

        return parsedResponse

    }

    public static search(query) {
        def url = movieSearch
        def params = "&query=" + URLEncoder.encode(query, "UTF-8")

        def response = callApi(params, url)

        return response
    }

    public static getMovie(id) {

        def url = movie + id.toString()
        def response = callApi(null, url)

        return response
    }

    public static getMovieVideos(id) {

        def url = movie + id.toString() + videos
        def response = callApi(null, url)

        return response.results
    }

    public static getMovieCredits(id) {

        def url = movie + id.toString() + credits
        def response = callApi(null, url)

        return response
    }

    public static getMovieImages(id) {

        def url = movie + id.toString() + images
        def response = callApi(null, url)

        return response
    }

    public static getMovieReviews(id) {

        def url = movie + id.toString() + reviews
        def response = callApi(null, url)

        return response
    }

}
