package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by kr29 on 5/9/2017.
 */
public class AlbumlabelEntityPK implements Serializable {
    private long albumid;
    private long labelid;

    @Column(name = "ALBUMID")
    @Id
    public long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(long albumid) {
        this.albumid = albumid;
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

        AlbumlabelEntityPK that = (AlbumlabelEntityPK) o;

        if (albumid != that.albumid) return false;
        if (labelid != that.labelid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (albumid ^ (albumid >>> 32));
        result = 31 * result + (int) (labelid ^ (labelid >>> 32));
        return result;
    }
}
