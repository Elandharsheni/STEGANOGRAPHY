package Data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class util {
	private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/stegno";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static Connection connection;

	public static synchronized Connection getconnection() throws SQLException {
		if (connection != null && !connection.isClosed()) {
			return connection;
		}

		String url = System.getenv("STEGNO_DB_URL");
		String username = System.getenv("STEGNO_DB_USER");
		String password = System.getenv("STEGNO_DB_PASSWORD");
		if (url == null || url.trim().isEmpty()) {
			url = DEFAULT_URL;
		}
		if (username == null || username.trim().isEmpty() || password == null) {
			throw new SQLException("Set STEGNO_DB_USER and STEGNO_DB_PASSWORD before using the database.");
		}

		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			throw new SQLException("MySQL JDBC driver was not found in WEB-INF/lib.", e);
		}

		connection = DriverManager.getConnection(url, username, password);
		return connection;
	}
}
