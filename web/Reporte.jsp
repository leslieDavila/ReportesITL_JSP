<%-- 
    Document   : Reporte
    Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="java.util.List"%>
<%@page import="DATOS.DAO"%>
<%@page import="DATOS.Reporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css"/> 
        <title>Reporte</title>
    </head>
    <body>

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

        <section class="seccion centrar">
            <p>Instituto Tecnológico de León</p>
            <p>Departamento de Sistemas Computacionales</p>
            <p>Periodo Agosto-Diciembre 2020</p>

        </section>



        <section class="seccion lados">

            <%

                //Sesion activa
                if (session != null) {
                    if (session.getAttribute("usuario") != null) {
                        String name = (String) session.getAttribute("usuario");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                }

                String idMaestro;

                DAO obj = new DAO();

                idMaestro = request.getParameter("idMaestro");
                String nombre = (String) (obj.getMaestro(idMaestro));

                //Tabla
                out.print("<table Style='border-collapse:collapse' border='1' width='100%'>");
                out.print("<tr>");
                out.print("<th scope='col'>Maestro:</th>");
                out.print("<td>" + nombre + "</td>");
                out.print("<tr>");
                out.print("<tr>");
                out.print("<th scope='col'>Clave:</th>");
                out.print("<td>" + idMaestro + "</td>");
                out.print("<tr>");
                out.print("</table>");

                List<Reporte> list = DAO.getReporte(idMaestro);

                // clave grupo, clave materia, nombre materia, grupo, aula, no alum, idcarrera, semestre, horario, ht, tp, creditos
                out.print("<table Style='border-collapse:collapse' border='1' width='100%'>");

                out.print("<tr><th>Clave Grupo</th><th>Clave Materia</th><th>Materia</th><th>Grupo</th><th>Aula</th><th>No. Alumnos</th><th>Carrera</th><th>Semestre</th><th>Horario</th><th>HT</th><th>HP</th><th>Creditos</th></tr>");
                for (Reporte r : list) {
                    out.print("<tr><td>" + r.getIdGrupo()
                            + "</td><td>" + r.getIdMateria()
                            + "</td><td>" + r.getNombreMateria()
                            + "</td><td>" + r.getGrupo()
                            + "</td><td>" + r.getAula()
                            + "</td><td>" + r.getNumAlumnos()
                            + "</td><td>" + r.getIdCarrera()
                            + "</td><td>" + r.getSemestre()
                            + "</td><td>" + r.getHorario()
                            + "</td><td>" + r.getHt()
                            + "</td><td>" + r.getHp()
                            + "</td><td>" + r.getCreditos() + "</td></tr>");
                }

                out.print("</table>");

            %>
        </section>

    </body>
</html>
