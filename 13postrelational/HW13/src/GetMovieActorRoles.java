import oracle.kv.*;

import java.sql.*;
import java.util.Arrays;
import java.util.Map;

import static java.sql.JDBCType.NULL;

/**
 * Created by kr29 on 5/11/2017.
 */
public class GetMovieActorRoles {

    public static void main(String[] args) throws SQLException {

        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        System.out.println("Movie ID: 92616\nActor ID: 429719");

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("role", "429719", "92616"));

        //Get multiple roles?
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldName = field.getKey().getMinorPath().get(0);
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + fieldName + "\t: " + fieldValue);
        }




        store.close();
    }
}