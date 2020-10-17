<%-- 
    Document   : ModificarMateria2
    Author     : Leslie Karen Davila Gallegos
--%>

<%@page import="DATOS.DAO"%>
<%@page import="DATOS.Materia"%>
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
    

    String idMateria = request.getParameter("idMateria");
    String nombreMateria = request.getParameter("nombreMateria");
    String semestre = request.getParameter("semestre");
    String creditos = request.getParameter("creditos");
    String ht = request.getParameter("horasTeoria");
    String hp = request.getParameter("horasPractica");

    Materia m = new Materia();
    
    m.setIdMateria(idMateria);
    m.setNombreMateria(nombreMateria);
    m.setSemestre(semestre);
    m.setCreditos(creditos);
    m.setHt(ht);
    m.setHp(hp);
    
   

    int status = DAO.modificarMateria(m);
    if (status > 0) {
        response.sendRedirect("VerMaterias.jsp");
    } else {
        out.println("No se guardaron los cambios");
    }


%>

