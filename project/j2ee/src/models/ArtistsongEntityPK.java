package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by kr29 on 5/18/2017.
 */
public class ArtistsongEntityPK implements Serializable {
    private long artistid;
    private long songid;

    @Column(name = "ARTISTID")
    @Id
    public long getArtistid() {
        return artistid;
    }

    public void setArtistid(long artistid) {
        this.artistid = artistid;
    }

    @Column(name = "SONGID")
    @Id
    public long getSongid() {
        return songid;
    }

    public void setSongid(long songid) {
        this.songid = songid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtistsongEntityPK that = (ArtistsongEntityPK) o;

        if (artistid != that.artistid) return false;
        if (songid != that.songid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (artistid ^ (artistid >>> 32));
        result = 31 * result + (int) (songid ^ (songid >>> 32));
        return result;
    }
}
