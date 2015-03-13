<div class="movie--small clear" >
    <div class="movie--small__image" style="background-image: url('http://image.tmdb.org/t/p/w342${movie.poster_path}')"></div>
    <g:link controller="movies" action="view" id="${movie.id}" class="movie--small__title">${movie.title ?: movie.name}</g:link>
    <div class="movie--small__year">
    <g:if test="${movie.release_date}">
        ${new Date().parse('yyyy-mm-dd', movie.release_date).format('yyyy')}
    </g:if>
    <g:else>
        ----
    </g:else>
        </div>
    <div class="movie--small__rating" data-rating="${movie.vote_average}"></div>
</div>
