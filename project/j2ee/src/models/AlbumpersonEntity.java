package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/18/2017.
 */
@Entity
@Table(name = "ALBUMPERSON", schema = "PROJECT", catalog = "")
@IdClass(AlbumpersonEntityPK.class)
public class AlbumpersonEntity {
    private long albumid;
    private long personid;
    private String role;

    public AlbumpersonEntity (long albumId, long personId, String role) {
        this.albumid = albumId;
        this.personid = personId;
        this.role = role;
    }

    @Id
    @Column(name = "ALBUMID")
    public long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(long albumid) {
        this.albumid = albumid;
    }

    @Id
    @Column(name = "PERSONID")
    public long getPersonid() {
        return personid;
    }

    public void setPersonid(long personid) {
        this.personid = personid;
    }

    @Id
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

        AlbumpersonEntity that = (AlbumpersonEntity) o;

        if (albumid != that.albumid) return false;
        if (personid != that.personid) return false;
        if (role != null ? !role.equals(that.role) : that.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (albumid ^ (albumid >>> 32));
        result = 31 * result + (int) (personid ^ (personid >>> 32));
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }
}
