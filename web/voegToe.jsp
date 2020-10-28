<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="domain.model.DierSoort" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Voeg een huisdier toe</title>
    <link rel="stylesheet" type="text/css" href="style/style.css"/>
</head>
<body>
<div id="container">
    <jsp:include page="header.jsp">
        <jsp:param name="actual" value="voegToe"/>
    </jsp:include>
    <main>
        <h2>Voeg je huisdier toe</h2>
        <div id="error">
            <ul>
                <li>Vul een correcte naam in.</li>
                <li>Geef een juist aantal maaltijden.</li>
            </ul>
        </div>
        <form method="POST" action="Servlet?command=voegToe">
            <p>
                <label for="naam">Naam:</label> <input id="naam" name="naam"
                                                       type="text" class="error">
            </p>
            <p>
                <label for="soort">Soort:</label>
                <select name="soort" id="soort">
                    <c:forEach items="${DierSoort.values()}" var="d">
                        <option value="${d}">${d}</option>
                    </c:forEach>
                </select>
            </p>

            <p>
                <label for="voedsel">Aantal keer eten per dag:</label> <input
                    id="voedsel" name="voedsel" type="number" value="2" class="error"
                    max="10" min="1">
            </p>
            <p>
                <input id="submit" type="submit" value="Verstuur">
            </p>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>