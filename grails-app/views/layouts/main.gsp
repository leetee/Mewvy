<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <!-- Place favicon.ico in the root directory -->

    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700|Cambay:400' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <asset:stylesheet src="normalize.css" />
    <asset:stylesheet src="screen.css" />
    <asset:javascript src="modernizr-2.8.3.min.js" />
    <g:layoutHead/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <asset:javascript src="plugins.js" />
    <asset:javascript src="main.js" />
    <asset:javascript src="/vendor/themoviedb.js" />
    <asset:javascript src="/vendor/jquery.raty.js" />
</head>
<body>
<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

<!-- Add your site or application content here -->
<div class="sidebar">
    <div class="sidebar__logo">
        <asset:image src="logo.svg"/>
    </div>
    <nav>
        <ul>
            <li><g:link uri="/" class="${controllerName == "discover" || "movies" ? "active" : "false"}"><span class="fa fa-th"></span> Discover</g:link></li>
            <li>
                <g:link controller="movies"><span class="fa fa-film"></span> My Movies</g:link>
                <ul>
                    <li><a href="#0" class="active">Watched <span class="count">52</span></a></li>
                    <li><a href="#0">Want to Watch <span class="count">4</span></a></li>
                </ul>
            </li>
            <li><a href="#0"><span class="fa fa-list-ol"></span> Top Lists</a></li>
        </ul>
    </nav>
</div>
<div class="main-content">
    <header class="main-content__header container">
        <div class="section-title">
            Discover
        </div>
        <div class="main-content__header__search">
            <g:form controller="discover" action="search">
                <input type="search" name="query" placeholder="${movie ? movie.title : "Search"}">
                <span class="fa fa-search"></span>
            </g:form>
        </div>
        <div class="main-content__header__login">
            <a href="#0">Log In</a>
            <input type="button" class="btn btn--green--filled" value="Sign Up">
        </div>
    </header>
    <g:layoutBody/>

</div>
<script>
    var ratings = $('.movie--large__rating, .movie--small__rating')

    $.each(ratings, function() {
        var rating = parseInt($(this).data('rating')) / 2
        $(this).raty({ score: rating })
    })
</script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
        e=o.createElement(i);r=o.getElementsByTagName(i)[0];
        e.src='http://www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
    ga('create','UA-XXXXX-X','auto');ga('send','pageview');
</script>
</body>
</html>


