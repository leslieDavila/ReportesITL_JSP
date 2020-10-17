<%-- 
    Document   : iniciojefe
    Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="DATOS.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
          <link rel="stylesheet" href="css/estilos.css"/> 
        <script type="text/javascript">
            history.forward();
        </script>

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
        <%
            //Sesion activa

            
            DAO obj=new DAO();

            if (session != null) {
                if (session.getAttribute("usuario") != null && session.getAttribute("tipo") != null) {
                    String name = (String) session.getAttribute("usuario");
                    String tipo = (String) session.getAttribute("tipo");
                   
                    // obtener el id
                    String idMaestro =(String)(obj.getIDMaestro(name));
                    //obtener el nombre
                    String nombre =(String)(obj.getMaestro(idMaestro));
                    out.print("<h2 class='bien centrar' Style='font-size:4rem; color: #18298C'>¡BIENVENIDO<span>" +nombre+"</span>!</h2>");

                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        %>
        
        
    </body>
</html>
