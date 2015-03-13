<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>

	</head>
	<body>

    <div class="popular-movies container">

        <g:each in="${popularMovies[0]}">
            <div class="movie--large">
                <div class="movie--large__image" style="background-image: url('http://image.tmdb.org/t/p/w1280${it.backdrop_path}')"><span class="image__overlay"></span></div>
                <div class="movie--large__container clear">
                    <g:link controller="movies" action="view" id="${it.id}" class="movie--large__title">${it.title}</g:link>
                    <div class="movie--large__rating" data-rating="${it.vote_average}"></div>
                    %{--<div class="movie--large__overview">${it.overview}</div>--}%
                    <ul class="movie--large__cast">
                        <label>Top Cast</label>
                        <g:each in="${it.cast}">
                            <li>
                                <span class="cast-member--thumbnail"><img src="http://image.tmdb.org/t/p/w45${it.profile_path}"/></span>
                                <div class="cast-member" style="background-image: url('http://image.tmdb.org/t/p/w185${it.profile_path};')">
                                    <span><h2>${it.name}</h2></span>
                                </div>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </g:each>

        <div>
            <g:render template="../partials/movie-small" collection="${popularMovies[1..6]}" var="movie"/>
        </div>


    </div>
	</body>
</html>
