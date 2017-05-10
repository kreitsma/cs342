package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/9/2017.
 */
@Entity
@Table(name = "ARTISTSONG", schema = "PROJECT", catalog = "")
@IdClass(ArtistsongEntityPK.class)
public class ArtistsongEntity {
    private long artistid;
    private long songid;
    private String role;

    @Id
    @Column(name = "ARTISTID")
    public long getArtistid() {
        return artistid;
    }

    public void setArtistid(long artistid) {
        this.artistid = artistid;
    }

    @Id
    @Column(name = "SONGID")
    public long getSongid() {
        return songid;
    }

    public void setSongid(long songid) {
        this.songid = songid;
    }

    @Basic
    @Column(name = "ROLE")
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtistsongEntity that = (ArtistsongEntity) o;

        if (artistid != that.artistid) return false;
        if (songid != that.songid) return false;
        if (role != null ? !role.equals(that.role) : that.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (artistid ^ (artistid >>> 32));
        result = 31 * result + (int) (songid ^ (songid >>> 32));
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }
}
