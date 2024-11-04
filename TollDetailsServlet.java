import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/TollDetailsServlet")
public class TollDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username"); // Retrieve username from session
        String url = "jdbc:sqlite:C:\\Users\\vibut\\MySQLiteDB";

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (username == null) {
            out.println("<html><body><h3>Error: Username not found in session. Please log in again.</h3></body></html>");
            return;
        }

        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn = DriverManager.getConnection(url);

            // Query toll collection data for the specific user
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM toll_collection WHERE username = ?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();

            out.println("<html><body><h3>Toll Collection Details for " + username + "</h3>");
            out.println("<table border='1'><tr><th>Date</th><th>Total Vehicles</th><th>Total Amount</th></tr>");

            boolean hasData = false;
            while (rs.next()) {
                hasData = true;
                out.println("<tr><td>" + rs.getString("date") + "</td><td>" + rs.getInt("total_vehicles") + "</td><td>" + rs.getDouble("total_amount") + "</td></tr>");
            }
            if (!hasData) {
                out.println("<tr><td colspan='3'>No data available for this user.</td></tr>");
            }

            out.println("</table></body></html>");
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><body><h3>Error fetching toll collection details: " + e.getMessage() + "</h3></body></html>");
        }
    }
}
