package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by kr29 on 5/9/2017.
 */
public class AlbumpersonEntityPK implements Serializable {
    private long albumid;
    private long personid;

    @Column(name = "ALBUMID")
    @Id
    public long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(long albumid) {
        this.albumid = albumid;
    }

    @Column(name = "PERSONID")
    @Id
    public long getPersonid() {
        return personid;
    }

    public void setPersonid(long personid) {
        this.personid = personid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AlbumpersonEntityPK that = (AlbumpersonEntityPK) o;

        if (albumid != that.albumid) return false;
        if (personid != that.personid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (albumid ^ (albumid >>> 32));
        result = 31 * result + (int) (personid ^ (personid >>> 32));
        return result;
    }
}
