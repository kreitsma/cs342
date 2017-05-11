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
        while (movies.next()) {
            //System.out.println(movies.getInt(1) + "\t" + movies.getString(2) + "\t"
                    //+ movies.getString(3));

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
            if (movies.getString(4) == null){
                rankVal = Value.createValue("".getBytes());
            } else {
                rankVal = Value.createValue(movies.getString(4).getBytes());
            }

            store.put(rank, rankVal);
        }
        movies.close();

        //Load actors
        ResultSet actors = jdbcStatement.executeQuery("SELECT id, firstName, lastName, gender FROM Actor");
        while (actors.next()) {
//            System.out.println(actors.getInt(1) + "\t" + actors.getString(2) + "\t"
//                    + actors.getString(3));
            //Key Structure by Name
            Key firstName = Key.createKey(Arrays.asList("actor", actors.getString(1)), Arrays.asList("firstName"));
            Value firstNameVal = Value.createValue(movies.getString(2).getBytes());
            store.put(firstName, firstNameVal);

        }
        actors.close();

        //Load roles
        ResultSet roles = jdbcStatement.executeQuery("SELECT actorId, movieId, role FROM Role");
        while (roles.next()) {
            System.out.println(roles.getInt(1) + "\t" + roles.getString(2) + "\t"
                    + roles.getString(3));
        }
        roles.close();


        jdbcStatement.close();
        jdbcConnection.close();
        store.close();
    }

}