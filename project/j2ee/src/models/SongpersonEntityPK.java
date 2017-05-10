package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by kr29 on 5/9/2017.
 */
public class SongpersonEntityPK implements Serializable {
    private long songid;
    private long personid;

    @Column(name = "SONGID")
    @Id
    public long getSongid() {
        return songid;
    }

    public void setSongid(long songid) {
        this.songid = songid;
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

        SongpersonEntityPK that = (SongpersonEntityPK) o;

        if (songid != that.songid) return false;
        if (personid != that.personid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (songid ^ (songid >>> 32));
        result = 31 * result + (int) (personid ^ (personid >>> 32));
        return result;
    }
}
