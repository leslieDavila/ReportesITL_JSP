<%-- 
    Document   : EliminarMateria
    Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="DATOS.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    
    //Sesion activa
    
    if (session != null) {
        if (session.getAttribute("usuario") != null) {
            String name = (String) session.getAttribute("usuario");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
    
    //Eliminar
    String idMateria = request.getParameter("idMateria");
    DAO.EliminarMateria(idMateria);
    response.sendRedirect("VerMaterias.jsp");
%>
