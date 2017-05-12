import oracle.kv.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

/**
 * This program used JDBC to query all the movies from the IMDB Movies table.
 * Include ojdbc6.jar (from the J2EE library) in the system path to support the JDBC functions.
 *
 * @author kvlinden
 * @version Spring, 2015
 */
public class LoadDB {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        Connection jdbcConnection = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "imdb", "bjarne");
        Statement jdbcStatement = jdbcConnection.createStatement();

        //Load movies
        ResultSet movies = jdbcStatement.executeQuery("SELECT id, name, year, rank FROM Movie");
        if (movies != null) {
            while (movies.next()) {
                //Key Structure by Name
                Key name = Key.createKey(Arrays.asList("movie", movies.getString(1)), Arrays.asList("name"));
                Value nameVal = Value.createValue(movies.getString(2).getBytes());
                store.put(name, nameVal);

                Key year = Key.createKey(Arrays.asList("movie", movies.getString(1)), Arrays.asList("year"));
                Value yearVal = Value.createValue(movies.getString(3).getBytes());
                store.put(year, yearVal);

                Key rank = Key.createKey(Arrays.asList("movie", movies.getString(1)), Arrays.asList("rank"));
                Value rankVal;
                //Handle the no score exception
                if (movies.getString(4) == null) {
                    rankVal = Value.createValue("".getBytes());
                } else {
                    rankVal = Value.createValue(movies.getString(4).getBytes());
                }

                store.put(rank, rankVal);
            }

            movies.close();

            //Load actors
            ResultSet actors = jdbcStatement.executeQuery("SELECT id, firstName, lastName FROM Actor");
            if (actors != null) {
                while (actors.next()) {
                    //Key Structure by Name
                    Key firstName = Key.createKey(Arrays.asList("actor", actors.getString(1)), Arrays.asList("firstName"));
                    Value firstNameVal = Value.createValue(actors.getString(2).getBytes());
                    store.put(firstName, firstNameVal);

                    Key lastName = Key.createKey(Arrays.asList("actor", actors.getString(1)), Arrays.asList("lastName"));
                    Value lastNameVal = Value.createValue(actors.getString(3).getBytes());
                    store.put(lastName, lastNameVal);

                }
            }
            actors.close();

            //Load roles
            ResultSet roles = jdbcStatement.executeQuery("SELECT movieId, actorId, role FROM Role");
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
}