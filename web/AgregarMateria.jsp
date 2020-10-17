<%-- 
    Document   : AgregarMateria
   
     Author     : Leslie Karen Davila Gallegos
--%>



<%@page import="DATOS.Materia"%>
<%@page import="DATOS.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/estilos.css"/> 
        <title>Registrar Materia</title>
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
            if (session != null) {
                if (session.getAttribute("usuario") != null) {
                    String name = (String) session.getAttribute("usuario");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
            
            //Registrar materia

            if (request.getParameter("registrar") != null) {
                String idMateria, nombreMateria, semestre, creditos, ht, hp;

                idMateria = request.getParameter("idMateria");
                nombreMateria = request.getParameter("nombreMateria");
                semestre = request.getParameter("semestre");
                creditos = request.getParameter("creditos");
                ht = request.getParameter("horasTeoria");
                hp = request.getParameter("horasPractica");

                Materia m = new Materia();
                m.setIdMateria(idMateria);
                m.setNombreMateria(nombreMateria);
                m.setSemestre(semestre);
                m.setCreditos(creditos);
                m.setHt(ht);
                m.setHp(hp);
                

                int status = DAO.registrar(m);

                if (status > 0) {
                  
                    response.sendRedirect("VerMaterias.jsp");
                } else {
                    out.println("No se realizo el registro");
                }

            }
            
            
            

        %>

        

        <h1 class="centrar titulos">Registrar Materia</h1>


        <form action="AgregarMateria.jsp" method="post" class="formulario">
            Clave materia : <input type="text" name="idMateria"><br>
            Nombre materia : <input type="text" name="nombreMateria"><br>
            Semestre:
            <select name="semestre">
                <option selected value="0"> Seleccionar</option>
                <option >1</option> 
                <option >2</option> 
                <option >3</option>
                <option >4</option> 
                <option >5</option> 
                <option >6</option> 
                <option >7</option> 
                <option >8</option> 
                <option >9</option> 
            </select>

            <br>
            Creditos : 
            <select name="creditos">
                <option selected value="0"> Seleccionar</option>
                <option>4</option> 
                <option>5</option> 
                <option>6</option> 
            </select>
            <br>
            Horas teoria:
            <select name="horasTeoria">
                <option selected> Seleccionar</option>
                <option>1</option> 
                <option>2</option> 
                <option>3</option>
                <option>4</option> 
                <option>5</option> 
                <option>6</option> 
            </select>
            <br>
            Horas practica:
            <select name="horasPractica">
                <option selected> Seleccionar</option>
                <option>1</option> 
                <option>2</option> 
                <option>3</option>
                <option>4</option> 
                <option>5</option> 
                <option>6</option> 
            </select>
            <br>
            <input type="submit"  class="boton" name="registrar"value="Registrar">


        </form>

    </body>
</html>
