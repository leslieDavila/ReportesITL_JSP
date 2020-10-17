<%-- 
    Document   : index
     Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="DATOS.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="css/estilos.css"/> 
    </head>
    <body class="cuerpo">
        
        <h1 class="centrar titulos">Iniciar Sesión</h1>
        <form action="index.jsp" method="post" class="formulario">
            Usuario : <input type="text" name="usuario"><br>
            Contraseña : <input type="password" name="pass"><br>
            <input type="submit" class="boton" name="ingresar"value="Iniciar sesion">
        </form>

        <%

            DAO dao = new DAO();

            if (request.getParameter("ingresar") != null) {
                String usuario = request.getParameter("usuario");
                String pass = request.getParameter("pass");
                HttpSession sesion = request.getSession();
                switch (dao.iniciarSesion(usuario, pass)) {
                    case 1:
                        sesion.setAttribute("usuario", usuario);
                        sesion.setAttribute("tipo", "1");
                        response.sendRedirect("iniciojefe.jsp");
                        break;

                    case 2:
                        sesion.setAttribute("usuario", usuario);
                        sesion.setAttribute("tipo", "2");

                        response.sendRedirect("iniciomaestro.jsp");
                        break;

                    default:
                        out.write("usuario y/o contraseñas incorrectas");

                }
            }

            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                //request.getSession().invalidate();
            }


        %>


    </body>
</html>
