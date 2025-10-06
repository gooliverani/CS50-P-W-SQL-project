import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Hack {
    public static void main(String[] args) throws Exception {
        // Create scanner for user input
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the new password: ");
        String newPassword = scanner.nextLine();

        // Establish database connection
        Connection connection = DriverManager.getConnection("jdbc:sqlite:dont-panic.db");

        // Prepare SQL statement with placeholder
        String query = """
            UPDATE "users"
            SET "password" = ?
            WHERE "username" = 'admin';
        """;

        // Create prepared statement and set parameters
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, newPassword);

        // Execute update
        statement.executeUpdate();

        // Clean up resources
        statement.close();
        connection.close();
        scanner.close();
    }
}
