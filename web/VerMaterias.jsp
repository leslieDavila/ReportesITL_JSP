<%-- 
    Document   : VerMaterias
     Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="DATOS.Materia"%>
<%@page import="DATOS.DAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css"/> 
        <title>Materias</title>
    </head>
    <body
        <header>
            <div class="contenedor-usuario">
                <div class="cont-two">
                    <nav class="navegacion-usuario">


                        <a href="iniciojefe.jsp">Inicio</a>
                        <a href="AgregarMateria.jsp">Agregar Materia</a>
                        <a href="VerMaterias.jsp">Listado de materias</a>
                        <a href="Sabana.jsp">Grupos</a></li>

                        <a class="cerrar-sesion" href='index.jsp?cerrar=true'>Cerrar Sesion</a>



                    </nav> 

                </div>
            </div>


        </header>
        <h1 class="centrar titulos">Listado de Materias</h1>

        <section class="lados seccion">

            <table Style="border-collapse:collapse" border='1' width='100%'>

                <%

                    //Sesion activa
                    if (session != null) {
                        if (session.getAttribute("usuario") != null) {
                            String name = (String) session.getAttribute("usuario");
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    }
                    
                    List<Materia> list = DAO.getAllMaterias();
                    out.print("<tr><th>Clave Materia</th><th>Materia</th><th>Semestre</th><th>Creditos</th><th>HT</th><th>HP</th><th>Editar</th><th>Eliminar</th></tr>");
                    for (Materia e : list) {
                        out.print("<tr><td>" + e.getIdMateria() + "</td><td>" + e.getNombreMateria() + "</td><td>" + e.getSemestre() + "</td><td>" + e.getCreditos() + "</td><td>" + e.getHt() + "</td><td>" + e.getHp() + "</td><td><a href='ModificarMateria.jsp?idMateria=" + e.getIdMateria() + "'>Modificar</a></td><td><a href='EliminarMateria.jsp?idMateria=" + e.getIdMateria() + "'>Eliminar</a></td></tr>");
                    }
         //<td><a href='ModificarServlet?NUMEROCONTROL=" + e.getNumeroControl() + "'>Modificar</a></td>
%>

            </table>
        </section>
    </body>
</html>
