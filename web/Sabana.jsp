<%-- 
    Document   : Sabana
    Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="java.util.List"%>
<%@page import="DATOS.Sabana"%>
<%@page import="DATOS.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css"/> 
        <title>Grupos</title>
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


        <h1 class="centrar titulos">Grupos</h1>



        <section class="lados seccion">
            <form action="Reporte.jsp" method="post">
                <label>Ver reporte</label>
                <input type="search" name="idMaestro" placeholder="Search...">		    	
                <button>Buscar</button>
            </form>
        </section>

        <section class="lados seccion"> 


            <%

                //Sesion activa
                if (session != null) {
                    if (session.getAttribute("usuario") != null) {
                        String name = (String) session.getAttribute("usuario");
                        //out.print(name);
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                }

                // ClaveGrupo clave materia, clave carrera, materia, carrera, maestro, periodo, turno, 
                //grupo, no.alumnos, semestre, creditos,horario,aula
                out.print("<table Style='border-collapse:collapse' border='1' width='100%'");
                List<Sabana> list = DAO.getSabana();

                out.print("<tr><th>Clave Grupo</th><th>Clave Materia</th><th>Clave Carrera</th><th>Materia</th><th>Carrera</th><th>Maestro</th><th>Periodo</th><th>Turno</th><th>Grupo</th><th>No. Alumnos</th><th>Semestre</th><th>Creditos</th><th>Horario</th><th>Aula</th></tr>");
                for (Sabana s : list) {
                    out.print("<tr><td>" + s.getIdGrupo()
                            + "</td><td>" + s.getIdMateria()
                            + "</td><td>" + s.getIdCarrera()
                            + "</td><td>" + s.getMateria()
                            + "</td><td>" + s.getCarrera()
                            + "</td><td>" + s.getMaestro()
                            + "</td><td>" + s.getPeriodo()
                            + "</td><td>" + s.getTurno()
                            + "</td><td>" + s.getGrupo()
                            + "</td><td>" + s.getNumAlumnos()
                            + "</td><td>" + s.getSemestre()
                            + "</td><td>" + s.getCreditos()
                            + "</td><td>" + s.getHorario()
                            + "</td><td>" + s.getAula() + "</td></tr>");
                }


            %>
        </table>
    </section>

</body>
</html>
