package Demo;


public class AdminLog {

	private static final String USER_ID = "admin@123";
	
	private static final String PASSWORD = "12345";
	
	public static boolean validateUser(String id, String pass) {
		return USER_ID.equals(id) && PASSWORD.equals(pass);
	}
	
}
