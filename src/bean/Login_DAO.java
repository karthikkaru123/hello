package bean;
import bean.Connection_provider;
import bean.LoginBean;
import java.sql.*;

public class Login_DAO  extends Connection_provider {
	
	 
	public static boolean validate(LoginBean bean)
	{
	
		 boolean status =false;
		try{
			Connection con=Connection_provider.getcon();  
	 PreparedStatement ps=con.prepareStatement("SELECT Email,password FROM quiz_register WHERE Email=? and password=? ");
	    ps.setString(1,bean.getEmail());
		ps.setString(2,bean.getPass());
		ResultSet rs=ps.executeQuery();
		
		status=rs.next();
		}catch(Exception e){}
		return status;
	}
	
	
	

}
