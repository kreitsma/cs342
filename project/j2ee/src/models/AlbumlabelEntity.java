package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/9/2017.
 */
@Entity
@Table(name = "ALBUMLABEL", schema = "PROJECT", catalog = "")
@IdClass(AlbumlabelEntityPK.class)
public class AlbumlabelEntity {
    private long albumid;
    private long labelid;

    @Id
    @Column(name = "ALBUMID")
    public long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(long albumid) {
        this.albumid = albumid;
    }

    @Id
    @Column(name = "LABELID")
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

        AlbumlabelEntity that = (AlbumlabelEntity) o;

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
