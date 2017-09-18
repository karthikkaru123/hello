package bean;
import bean.Connection_provider;
import java.sql.*;

public class Register_DAO extends Connection_provider {
	public static int register(User u){  
		int status=0;  
		try{  
		Connection con=Connection_provider.getcon();  
		PreparedStatement ps=con.prepareStatement("insert into quiz_register values(?,?,?)");  
		ps.setString(1,u.getUname());  
		ps.setString(2,u.getUemail());  
		ps.setString(3,u.getUpass());  
		              
		status=ps.executeUpdate();  
		}catch(Exception e){}  
		      
		return status;  
	}
}
