

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentRegAction
 */
@WebServlet("/StudentRegAction")
public class StudentRegAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRegAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String rn=request.getParameter("rno");
		String na=request.getParameter("name");
		String em=request.getParameter("email");
		String bn=request.getParameter("branch");
		String mob=request.getParameter("mobile");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pavani","root","");
			PreparedStatement ps= con.prepareStatement("insert into student values('"+rn+"','"+na+"','"+em+"','"+bn+"','"+mob+"')");
			int i=ps.executeUpdate();
			if(i>0){
				response.sendRedirect("studentlogin.html");
			}
			else{
				response.sendRedirect("studentreg.html");
			}
		}
		catch(Exception s){
			System.out.println(s);
		}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
