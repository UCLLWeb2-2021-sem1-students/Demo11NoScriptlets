<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vind je huisdier</title>
    <link rel="stylesheet" type="text/css" href="style/style.css"/>
</head>
<body>
<div id="container">
    <jsp:include page="header.jsp"/>
    <main>

        <h2>Bevestiging</h2>
        <c:choose>
            <c:when test="${gevondenDier == null}">
                <p>We hebben het dier met naam ${param.naam} niet gevonden.
            </c:when>
            <c:otherwise>
                <p>Het dier met naam ${param.naam}
                    moet ${gevondenDier.voedsel} keer per dag eten krijgen.</p>
            </c:otherwise>
        </c:choose>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>