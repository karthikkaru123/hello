package bean;
import bean.Provider;
import java.sql.*;
public class Connection_provider implements Provider {
public static Connection conn=null;
	
static {
	try{
		Class.forName(Driver);
		conn=DriverManager.getConnection( Connection_url, db_uname, db_upwd);
		
	}catch(Exception e){}
}
public static Connection getcon()
{
	return conn;
}

}
