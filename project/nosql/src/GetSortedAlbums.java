import oracle.kv.*;

import java.sql.SQLException;
import java.util.*;

/**
 * Created by kr29 on 5/18/2017.
 */
public class GetSortedAlbums {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        //Create HashMap to store albums in
        HashMap<String, List<List<String>>> albums = new HashMap<>();
        //Create Sorted Set for sorted years
        SortedSet<Integer> years = new TreeSet<>();

        Key key = Key.createKey(Arrays.asList("album"));
        Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, key, null, null);

            while (it.hasNext()) {
            List<String> currentAlbum = new ArrayList<>();
            KeyValueVersion kv = it.next();

            if (kv.getKey().getMinorPath().get(0).equals("yearNom")) {
                String albumId = kv.getKey().getMajorPath().get(1);
                String year = new String(kv.getValue().getValue());

                //Add ID and name of album
                currentAlbum.add(getNameOfAlbum(albumId));
                currentAlbum.add("ID: " + albumId);


                //Add current album's year to the sorted set
                if (!years.contains(Integer.parseInt(year))) {
                    years.add(Integer.parseInt(year));
                }

                if (albums.containsKey(year)) {
                    albums.get(year).add(currentAlbum);
                }
                //If the year key is not in the sorted set, add it in with a blank placeholder value
                else {
                    List<List<String>> placeholder = new ArrayList<>();
                    placeholder.add(currentAlbum);
                    albums.put(year, placeholder);
                }
            }
        }

            //Print sorted list
            for (Integer year : years) {
                for (List<String> albumInfo : albums.get(year.toString())) {
                    System.out.println(year);
                    for (String info : albumInfo) {
                        System.out.println(info);
                    }
                    System.out.println("");
                }
            }

            store.close();
    }

    //Get the name of the album
    public static String getNameOfAlbum(String albumId) {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        String name = new String();

        Key majorKeyPath = Key.createKey(Arrays.asList("album", albumId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if (field.getKey().getMinorPath().get(0).equals("name")) {
                name = new String(field.getValue().getValue().getValue());
            }
        }
        return name;
    }
}
