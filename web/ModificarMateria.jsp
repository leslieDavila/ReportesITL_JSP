<%-- 
    Document   : ModificarMateria
    Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="DATOS.Materia"%>
<%@page import="DATOS.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/estilos.css"/> 
        <title>Modificar</title>
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
        
        <h1 class="centrar titulos">Modificar Materia</h1>
        
        <form action='ModificarMateria2.jsp' method='post' class="formulario">
            <table>

               
                <%

                //Sesion activa
                    if (session != null) {
                        if (session.getAttribute("usuario") != null) {
                            String name = (String) session.getAttribute("usuario");
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    }

                    String idMateria = request.getParameter("idMateria");

                    Materia m = DAO.getMateria(idMateria);

                    out.print("<tr><td></td><td><input type='hidden' name='idMateria' value='" + m.getIdMateria() + "'/></td></tr>");
                    out.print("<tr><td>Nombre:</td><td><input type='text' name='nombreMateria' value='" + m.getNombreMateria() + "'/></td></tr>");
                    out.print("<tr><td>Semestre:</td><td><input type='text' name='semestre' value='" + m.getSemestre() + "'/> </td></tr>");

                    out.print("<tr><td>Creditos:</td><td>");
                    out.print("<select name='creditos' style='width:150px'>");
                    out.print("<option>4</option>");
                    out.print("<option>5</option>");
                    out.print("<option>6</option>");

                    out.print("</select>");
                    out.print("</td></tr>");

                    out.print("<tr><td>Horas teoria:</td><td>");
                    out.print("<select name='horasTeoria' style='width:150px'>");
                    out.print("<option>1</option>");
                    out.print("<option>2</option>");
                    out.print("<option>3</option>");
                    out.print("<option>4</option>");
                    out.print("<option>5</option>");
                    out.print("<option>6</option>");
                    out.print("</select>");
                    out.print("</td></tr>");

                    out.print("<tr><td>Horas practica:</td><td>");
                    out.print("<select name='horasPractica' style='width:150px'>");
                    out.print("<option>1</option>");
                    out.print("<option>2</option>");
                    out.print("<option>3</option>");
                    out.print("<option>4</option>");
                    out.print("<option>5</option>");
                    out.print("<option>6</option>");
                    out.print("</select>");
                    out.print("</td></tr>");

                %>
                <tr><td colspan='2'><input  class="boton" type='submit' value='Guardar cambios'/></td></tr>
            </table>
        </form>



    </body>
</html>
