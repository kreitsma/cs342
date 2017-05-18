package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/18/2017.
 */
@Entity
@Table(name = "SONGLABEL", schema = "PROJECT", catalog = "")
@IdClass(SonglabelEntityPK.class)
public class SonglabelEntity {
    private long songid;
    private long labelid;

    public SonglabelEntity (long songId, long labelId) {
        this.songid = songId;
        this.labelid = labelId;
    }

    @Id
    @Column(name = "SONGID")
    public long getSongid() {
        return songid;
    }

    public void setSongid(long songid) {
        this.songid = songid;
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

        SonglabelEntity that = (SonglabelEntity) o;

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
