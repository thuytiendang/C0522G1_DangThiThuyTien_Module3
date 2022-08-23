import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ConverterServlet", value = "/ConverterServlet")
public class ConverterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate= Float.parseFloat(request.getParameter("rate"));
        float usd= Float.parseFloat(request.getParameter("rate"));

        float vnd = rate*usd;
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("usd",usd);
        request.setAttribute("vnd",vnd);
        requestDispatcher.forward(request,response);
    }
}
