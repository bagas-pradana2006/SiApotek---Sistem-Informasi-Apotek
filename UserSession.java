
package apotekv2;


public class UserSession {
    private static String username;
    private static String namaLengkap;
    private static String role;

    // Setter (Untuk menyimpan data saat berhasil login)
    public static void setUserLogin(String user, String nama, String hakAkses) {
        username = user;
        namaLengkap = nama;
        role = hakAkses;
    }

    // Getter (Untuk mengambil data di form lain)
    public static String getUsername() {
        return username;
    }

    public static String getNamaLengkap() {
        return namaLengkap;
    }

    public static String getRole() {
        return role;
    }
    
    // Untuk menghapus data saat Logout
    public static void logout() {
        username = null;
        namaLengkap = null;
        role = null;
    }
}
