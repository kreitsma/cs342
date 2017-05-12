import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by kr29 on 5/11/2017.
 */
public class GetMovieActors {
    public static void main(String[] args) throws SQLException {

        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        System.out.println("Table: movie\nID: 92616");

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("role", "92616"));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldName = field.getKey().getMinorPath().get(0);
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + fieldValue + "\t " + getActor(fieldValue) + ":\t " + fieldName);
        }

        store.close();
    }

    public static String getActor(String actorId) {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        String name = new String();

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("actor", actorId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            name = new String(field.getValue().getValue().getValue());
        }
        return name;
    }
}
