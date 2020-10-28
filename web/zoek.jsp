<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
        <jsp:param name="actual" value="zoekForm"/>
    </jsp:include>
        <main>
        <h2>Zoek je huisdier</h2>
        <div id="error">
            <ul>
                <li>Vul een correcte naam in.</li>
            </ul>
        </div>
        <form method="GET" action="Servlet?command=zoek">
            <p>
                <label for="naam">Naam:</label> <input id="naam" name="naam"
                                                       type="text" class="error">
            </p>
            <input type="hidden" name="command" value="zoek"/>
            <p>
                <input id="submit" type="submit" value="Zoek">
            </p>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>