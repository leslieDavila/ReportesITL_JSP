package DATOS;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    //CONEXION A LA BD
    public static Connection getConnection() {

        Connection con = null;
        String url = "jdbc:derby://localhost:1527/DAVILA";
        String user = "DAVILA";
        String pass = "123456";

        Driver driver = new org.apache.derby.jdbc.ClientDriver();

        try {
            DriverManager.registerDriver(driver);
            con = DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            System.out.println(e);
        }
        return con;

    }

    public int iniciarSesion(String usuario, String pass) throws SQLException {
        ResultSet rs;
        int tipo = 0;

        String sql = "select TIPO from USUARIOS where USUARIO='" + usuario + "' and CONTRASENA='" + pass + "'";
        Connection con = DAO.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            tipo = rs.getInt(1);

        }
        DAO.getConnection().close();

        return tipo;
    }

    public String getIDMaestro(String usuario) throws SQLException {
        ResultSet rs;
        String idMaestro = "";

        String sql = "select IDMAESTRO from USUARIOS where USUARIO='" + usuario + "'";
        Connection con = DAO.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            idMaestro = rs.getString(1);
        }
        DAO.getConnection().close();
        return idMaestro;
    }

    public String getMaestro(String idMaestro) throws SQLException {

        ResultSet rs;
        String maestro = "";

        String sql = "select NOMBREMAESTRO from MAESTRO where IDMAESTRO='" + idMaestro + "'";
        Connection con = DAO.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            maestro = rs.getString(1);
        }
        DAO.getConnection().close();
        return maestro;
    }

    //Registrar mateia
    public static int registrar(Materia m) {
        int status = 0;
        try {
            Connection con = DAO.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "insert into MATERIA(IDMATERIA,NOMBREMATERIA,SEMESTRE,CREDITOS, HT, HP) values (?,?,?,?,?,?)");
            ps.setString(1, m.getIdMateria());
            ps.setString(2, m.getNombreMateria());
            ps.setString(3, m.getSemestre());
            ps.setString(4, m.getCreditos());
            ps.setString(5, m.getHt());
            ps.setString(6, m.getHp());

            status = ps.executeUpdate();

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    //Ver Materias
    public static List<Materia> getAllMaterias() {
        List<Materia> list = new ArrayList<Materia>();

        try {
            Connection con = DAO.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from MATERIA");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Materia m = new Materia();

                m.setIdMateria(rs.getString(1));
                m.setNombreMateria(rs.getString(2));
                m.setSemestre(rs.getString(3));
                m.setCreditos(rs.getString(4));
                m.setHt(rs.getString(5));
                m.setHp(rs.getString(6));

                list.add(m);

            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //ELIMINAR
    public static int EliminarMateria(String idMateria) {
        int status = 0;
        try {
            Connection con = DAO.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from MATERIA where IDMATERIA=?");
            ps.setString(1, idMateria);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    //Ver Materia por su id
    public static Materia getMateria(String idMateria) {
        Materia m = new Materia();

        try {
            Connection con = DAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM MATERIA WHERE IDMATERIA=?");
            ps.setString(1, idMateria);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                m.setIdMateria(rs.getString(1));
                m.setNombreMateria(rs.getString(2));
                m.setSemestre(rs.getString(3));
                m.setCreditos(rs.getString(4));
                m.setHt(rs.getString(5));
                m.setHp(rs.getString(6));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return m;
    }
   

    //MODIFICAR
    public static int modificarMateria(Materia m) {
        int status = 0;
        try {
            Connection con = DAO.getConnection();
            String sql="update MATERIA set NOMBREMATERIA=?, SEMESTRE=? , CREDITOS=?, HT=?, HP=? where IDMATERIA=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, m.getNombreMateria());
            ps.setString(2, m.getSemestre());
            ps.setString(3, m.getCreditos());
            ps.setString(4, m.getHt());
            ps.setString(5, m.getHp());
            ps.setString(6, m.getIdMateria());

            status = ps.executeUpdate();

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }
    

    //---------------------------- REPORTES -----------------------------------
    //Ver reporte por maestro
    public static List<Reporte> getReporte(String idMaestro) {
        List<Reporte> list = new ArrayList<Reporte>();
        try {
            Connection con = DAO.getConnection();
            String sql = "SELECT G.IDGRUPO, G.IDMATERIA, M.NOMBREMATERIA,G.GRUPO, G.AULA, G.NUMALUMNOS, G.IDCARRERA, M.SEMESTRE, G.HORARIO, M.HT, M.HP, M.CREDITOS \n"
                    + "FROM GRUPO G, MAESTRO MA, CARRERA C, MATERIA M \n"
                    + "WHERE MA.IDMAESTRO = G.IDMAESTRO AND G.IDMATERIA = M.IDMATERIA AND G.IDCARRERA = C.IDCARRERA AND MA.IDMAESTRO=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, idMaestro);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Reporte r = new Reporte();
                // clave grupo, clave materia, nombre materia, grupo, aula, no alum, idcarrera, semestre, horario, ht, tp, creditos

                r.setIdGrupo(rs.getString(1));
                r.setIdMateria(rs.getString(2));
                r.setNombreMateria(rs.getString(3));
                r.setGrupo(rs.getString(4));
                r.setAula(rs.getString(5));
                r.setNumAlumnos(rs.getString(6));
                r.setIdCarrera(rs.getString(7));
                r.setSemestre(rs.getString(8));
                r.setHorario(rs.getString(9));
                r.setHt(rs.getString(10));
                r.setHp(rs.getString(11));
                r.setCreditos(rs.getString(12));

                list.add(r);

            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //-------------------- SABANA ---------------------------------------
    public static List<Sabana> getSabana() {
        List<Sabana> lista = new ArrayList<Sabana>();
        try {
            Connection con = DAO.getConnection();
          
            String sql = "SELECT G.IDGRUPO, G.IDMATERIA,C.IDCARRERA, M.NOMBREMATERIA,C.NOMBRECARRERA, MA.NOMBREMAESTRO,G.PERIODO,G.TURNO, G.GRUPO, G.NUMALUMNOS, M.SEMESTRE,M.CREDITOS, G.HORARIO, G.AULA FROM GRUPO G, MAESTRO MA, CARRERA C, MATERIA M WHERE MA.IDMAESTRO = G.IDMAESTRO AND G.IDMATERIA = M.IDMATERIA AND G .IDCARRERA = C.IDCARRERA";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Sabana s = new Sabana();
                // ClaveGrupo clave materia, clave carrera, materia, carrera, maestro, periodo, turno, grupo, no.alumnos, semestre, creditos,horario,aula

                s.setIdGrupo(rs.getString(1));
                s.setIdMateria(rs.getString(2));
                s.setIdCarrera(rs.getString(3));
                s.setMateria(rs.getString(4));
                s.setCarrera(rs.getString(5));
                s.setMaestro(rs.getString(6));
                s.setPeriodo(rs.getString(7));
                s.setTurno(rs.getString(8));
                s.setGrupo(rs.getString(9));
                s.setNumAlumnos(rs.getString(10));
                s.setSemestre(rs.getString(11));
                s.setCreditos(rs.getString(12));
                s.setHorario(rs.getString(13));
                s.setAula(rs.getString(14));

                lista.add(s);

            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

}
