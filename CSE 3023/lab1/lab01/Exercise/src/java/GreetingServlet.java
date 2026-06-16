
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GreetingServlet")
public class GreetingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Retrieve the 'name' parameter
        String name = request.getParameter("name");

        // 2. Default to 'Guest' if parameter is missing or empty
        if (name == null || name.trim().isEmpty()) {
            name = "Guest";
        }

        // 3. Set the name as a request attribute to pass to JSP
        request.setAttribute("userName", name);

        // 4. Forward the request to greeting.jsp
        request.getRequestDispatcher("Greeting.jsp").forward(request, response);
    }
}
