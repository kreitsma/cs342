package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by kr29 on 5/9/2017.
 */
public class SonglabelEntityPK implements Serializable {
    private long songid;
    private long labelid;

    @Column(name = "SONGID")
    @Id
    public long getSongid() {
        return songid;
    }

    public void setSongid(long songid) {
        this.songid = songid;
    }

    @Column(name = "LABELID")
    @Id
    public long getLabelid() {
        return labelid;
    }

    public void setLabelid(long labelid) {
        this.labelid = labelid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SonglabelEntityPK that = (SonglabelEntityPK) o;

        if (songid != that.songid) return false;
        if (labelid != that.labelid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (songid ^ (songid >>> 32));
        result = 31 * result + (int) (labelid ^ (labelid >>> 32));
        return result;
    }
}
