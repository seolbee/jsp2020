package unit01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num1 = 20;
		int num2 = 10;
		int sum = num1 + num2;
		PrintWriter out = resp.getWriter();
		
		out.print("<html><head><title>servlet test</title></head></html>");
		out.print("<body>");
		out.print("<h1>Servlet</h1>");
		out.print(num1 + " + " + num2 + " = " + sum);
		out.print("</body>");
		out.print("</html>");
		out.close();
	}
}
