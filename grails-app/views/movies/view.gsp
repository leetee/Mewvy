<%--
  Created by IntelliJ IDEA.
  User: leethomas
  Date: 21/02/15
  Time: 16:24
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<div class="movie">

    <div class="movie__header" style="background-image: url('http://image.tmdb.org/t/p/w1280${movie.backdrop_path}')">
        <span class="movie__header__overlay"></span>
    </div>
    <div class="movie__main clear">
        <div class="movie__main--left">
            <img class="movie__poster" src="http://image.tmdb.org/t/p/w342${movie.poster_path}"/>
            <div class="movie__rating" data-rating="${movie.vote_average}"></div>
            <div class="movie__rating__details">${movie.vote_average ? movie.vote_average / 2 : "?"} / 5 <span>(${movie.vote_count})</span></div>
            <div class="movie__options">
                <ul>
                    <li><a href="#0"><span class="fa fa-pencil"></span> Add Review</a></li>
                    <li><a href="#0"><span class="fa fa-video-camera"></span> Watch Trailer</a></li>
                </ul>
            </div>
            <div class="movie__images">
                <dl>
                    <dd>
                        <ul>
                            <g:if test="${movie.backdrops && movie.backdrops.size() > 5}">
                                <g:set var="backdrops" value="${movie.backdrops[0..5]}"/>
                            </g:if>
                            <g:else>
                                <g:set var="backdrops" value="${movie.backdrops}"/>
                            </g:else>
                            <g:each in="${backdrops}">
                                <li style="background-image: url('http://image.tmdb.org/t/p/w300${it.file_path}');"></li>
                            </g:each>
                        </ul>
                    </dd>
                </dl>
            </div>
        </div>


        <div class="movie__main--center">
            <div class="movie__title">
                <h1>${movie.title}
                    <span>
                    <g:if test="${movie.release_date}">
                        (${new Date().parse('yyyy-mm-dd', movie.release_date).format('yyyy')})
                    </g:if>
                    </span>
                </h1>
            </div>
            <div class="movie__release">
                <dl>
                    <g:if test="${movie.release_date}">
                        <dt>Release Date</dt>
                        <dd>${new Date().parse('yyyy-mm-dd', movie.release_date).format('dd MMMM yyyy')}</dd>
                    </g:if>
                    <g:if test="${movie.genres}">
                        <dt>Genres</dt>
                        <dd>
                            <g:each in="${movie.genres.name}">
                                <span class="category">${it[0]}</span>
                            </g:each>
                        </dd>
                    </g:if>
                </dl>
            </div>
        </div>

        <div class="movie__main--right">
            <div class="movie__actions">
                <a href="#0" class="action-btn"><span class="fa fa-film"></span>Add To My Movies</a>
                <a href="#0" class="action-btn action-btn--small"><span class="fa fa-share-alt"></span></a>
            </div>
        </div>

        <div class="movie__main--center-right">
            <div class="movie__overview">
                <dl>
                    <dt>Overview</dt>
                    <dd>${movie.overview}</dd>
                </dl>
            </div>
            <div class="movie__cast">
                <dl>
                    <dt>Cast</dt>
                    <dd>
                        <ul class="clear">
                            <g:each in="${movie.cast}">
                                <li>
                                    <span class="movie__cast__image" style="background-image: url('http://image.tmdb.org/t/p/w45${it.profile_path}');">
                                    </span>
                                    <span class="movie__cast__name">
                                        ${it.name}
                                    </span>
                                    <span class="movie__cast__role">
                                        as <span>${it.character}</span>
                                    </span>
                                </li>
                            </g:each>
                        </ul>
                        <g:if test="${movie.cast.size() > 12}">
                            <a href="#0" class="movie__cast__show-all"><span class="showAll">View More Cast Members</span><span class="hideAll">View Less Cast Members</span></a>
                        </g:if>
                    </dd>
                </dl>
            </div>
            <div class="movie__reviews">
                <dl>
                    <dt>Reviews (${movie.reviews.size()})</dt>
                    <dd>
                        <g:each in="${movie.reviews}">
                            <li class="movie__reviews__review <g:if test="${movie.reviews.size() == 1}">movie__reviews__review--full</g:if>">
                                <div class="movie__reviews__author">
                                    <span>${it.author}</span> reviewed <span>${movie.title}</span>
                                </div>
                                ${it.content.take(400)} <g:if test="${it.content.size() > 400}">...</g:if>
                            </li>
                        </g:each>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function() {
        var ratings = $('.movie__rating');

        $.each(ratings, function() {
                var rating = parseInt($(this).data('rating')) / 2;
                $(this).raty({ score: rating });
            });

        $('.movie__cast__show-all').on('click', function() {
            $(this).parents('.movie__cast').toggleClass('active');
        });
    });

</script>
</body>
</html>