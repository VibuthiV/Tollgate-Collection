import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String url = "jdbc:sqlite:C:\\Users\\vibut\\MySQLiteDB";

        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn = DriverManager.getConnection(url);
            PreparedStatement pst = conn.prepareStatement("INSERT INTO admin (username, password) VALUES (?, ?)");
            pst.setString(1, username);
            pst.setString(2, password);
            pst.executeUpdate();
            conn.close();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Registration Successful!</h3><a href='login.jsp'>Back to Login</a></body></html>");
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Registration Failed!</h3></body></html>");
        }
    }
}
