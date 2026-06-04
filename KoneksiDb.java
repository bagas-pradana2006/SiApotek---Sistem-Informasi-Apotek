
package apotekv2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class KoneksiDb {
    private static Connection koneksi;
    public static Connection getKoneksi() {
        if (koneksi == null) {
            try {
                String url = "jdbc:sqlserver://localhost:1433;databaseName=Apotek_V2;encrypt=true;trustServerCertificate=true;";
                String user = "Db_Con";
                String password = "12345678";
                
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                koneksi = DriverManager.getConnection(url, user, password);
                System.out.println("Koneksi Database Berhasil!");
            } catch (ClassNotFoundException | SQLException e) {
                JOptionPane.showMessageDialog(null, "Koneksi Database Gagal: " + e.getMessage());
            }
        }
        return koneksi;
    }
}

