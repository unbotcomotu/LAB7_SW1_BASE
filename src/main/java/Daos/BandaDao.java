package Daos;

import Beans.Banda;

import java.sql.*;
import java.util.ArrayList;

public class BandaDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/lab6sw1?serverTimezone=America/Lima";

    //En este caso se usa preparedStatement
    public ArrayList<Banda> obtenerListaBandas(String filter) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Banda> listabandas = new ArrayList<>();
        String sql = "select * from banda where lower(nombre_banda) like lower(concat('%',?,'%'))";
        try(Connection conn = DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,filter);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Banda banda = new Banda(rs.getString(1),rs.getString(2),rs.getInt(3));
                listabandas.add(banda);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listabandas;
    }


}
