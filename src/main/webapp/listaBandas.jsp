<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Banda" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Banda> listaBandas = (ArrayList<Banda>) request.getAttribute("listaBandas"); %>
<html>
    <!--Colocar como value: nombre de la presente página -->
    <jsp:include page="/static/head.jsp">
        <jsp:param name="title" value="Lista de Bandas"/>
    </jsp:include>
    <body>
        <div class='container'>
            <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
            <jsp:include page="/includes/navbar.jsp">
                <jsp:param name="page" value="bandas"/>
            </jsp:include>
            <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
                <div class="col-lg-6">
                    <h1 class='text-light'>Lista de Bandas</h1>
                </div>
            </div>
            <div class="tabla">
                <table class="table table-dark table-transparent table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>BANDA</th>
                            <th>LIDER</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%for(Banda banda : listaBandas){%>
                        <tr>
                            <td><%=banda.getIdBanda()%></td>
                            <td><%=banda.getNombre_banda()%></td>
                            <td><%=banda.getIdlider()%></td>
                        </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="/static/scripts.jsp"/>
    </body>
</html>
