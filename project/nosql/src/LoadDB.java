import oracle.kv.*;

import java.sql.*;
import java.util.Arrays;

/**
 * This program used JDBC to query all the movies from the Grammy Albums table.
 * Include ojdbc6.jar (from the J2EE library) in the system path to support the JDBC functions.
 *
 * @author kr29, based on kvlinden
 * @version Spring, 2017
 */
public class LoadDB {

    public static void main(String[] args) throws SQLException {
		//Configure store and connection
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        Connection jdbcConnection = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "project", "kr29");
        Statement jdbcStatement = jdbcConnection.createStatement();

        //Load albums
        ResultSet albums = jdbcStatement.executeQuery("SELECT id, name, yearNominated FROM Album");
        if (albums != null) {
            while (albums.next()) {

                Key name = Key.createKey(Arrays.asList("album", albums.getString(1)), Arrays.asList("name"));
                Value nameVal = Value.createValue(albums.getString(2).getBytes());
                store.put(name, nameVal);

                Key yearNom = Key.createKey(Arrays.asList("album", albums.getString(1)), Arrays.asList("yearNom"));
                Value yearVal = Value.createValue(albums.getString(3).getBytes());
                store.put(yearNom, yearVal);
            }

            albums.close();
        }

        //Load people
        ResultSet people = jdbcStatement.executeQuery("SELECT id, fName, lName, nickName FROM Person");
        if (people != null) {
            while (people.next()) {

                Key fName = Key.createKey(Arrays.asList("person", people.getString(1)), Arrays.asList("fName"));
                Value fNameVal;
                if (people.getString(2) == null) {
                    fNameVal = Value.createValue("".getBytes());
                } else {
                    fNameVal = Value.createValue(people.getString(2).getBytes());
                }
                store.put(fName, fNameVal);

                Key lName = Key.createKey(Arrays.asList("person", people.getString(1)), Arrays.asList("lName"));
                Value lNameVal;
                if (people.getString(3) == null) {
                    lNameVal = Value.createValue("".getBytes());
                } else {
                    lNameVal = Value.createValue(people.getString(3).getBytes());
                }
                store.put(lName, lNameVal);

                Key nickName = Key.createKey(Arrays.asList("person", people.getString(1)), Arrays.asList("nickName"));
                Value nickNameVal;
                if (people.getString(4) == null) {
                    nickNameVal = Value.createValue("".getBytes());
                } else {
                    nickNameVal = Value.createValue(people.getString(4).getBytes());
                }
                store.put(nickName, nickNameVal);
            }

            albums.close();
        }

        //Load Album roles
        ResultSet roles = jdbcStatement.executeQuery("SELECT albumId, personId, role FROM AlbumPerson");
        if (roles != null) {
            while (roles.next()) {

                Key role = Key.createKey(Arrays.asList("role", roles.getString(1)), Arrays.asList(roles.getString(3)));
                Value roleVal = Value.createValue(roles.getString(2).getBytes());
                store.put(role, roleVal);
            }
        }
        roles.close();


        jdbcStatement.close();
        jdbcConnection.close();
        store.close();
    }
}