
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="search container">
    <g:render template="../partials/movie-small" collection="${results}" var="movie"/>
</div>


</body>
</html>