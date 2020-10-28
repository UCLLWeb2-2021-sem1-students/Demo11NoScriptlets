<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <h1>Mijn huisdieren</h1>
    <nav>
        <ul>
            <li ${param.actual eq 'Home'?"id = actual":""}>
                <a href="Servlet?command=home">Home</a></li>
            <li ${param.actual eq 'voegToe'?"id = actual":""}>
                <a href="Servlet?command=voegToe">Voeg Toe</a></li>
            <li ${param.actual eq 'Overzicht'?"id = actual":""}>
                <a href="Servlet?command=overzicht">Overzicht</a></li>
            <li ${param.actual eq 'zoekForm'?"id = actual":""}>
                <a href="Servlet?command=zoekForm">Zoek</a></li>
        </ul>
    </nav>
</header>