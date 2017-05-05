import oracle.kv.*;

import java.util.Arrays;
import java.util.Map;

/**
 * Created by kr29 on 5/5/2017.
 */
public class HelloRecords {

    public static void main(String[] args) {

        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        System.out.println("New movie record:");

        Key name = Key.createKey(Arrays.asList("movie", "92616"), Arrays.asList("name"));
        Value nameVal = Value.createValue("Dr. Strangelove".getBytes());
        store.put(name, nameVal);

        Key year = Key.createKey(Arrays.asList("movie", "92616"), Arrays.asList("year"));
        Value yearVal = Value.createValue("1964".getBytes());
        store.put(year, yearVal);

        Key rating = Key.createKey(Arrays.asList("movie", "92616"), Arrays.asList("rating"));
        Value ratingVal = Value.createValue("8.7".getBytes());
        store.put(rating, ratingVal);

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("movie", "92616"));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldName = field.getKey().getMinorPath().get(0);
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + fieldName + "\t: " + fieldValue);
        }

        store.close();
    }
}
