package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/18/2017.
 */
@Entity
@Table(name = "SONGPERSON", schema = "PROJECT", catalog = "")
@IdClass(SongpersonEntityPK.class)
public class SongpersonEntity {
    private long songid;
    private long personid;
    private String role;

    @Id
    @Column(name = "SONGID")
    public long getSongid() {
        return songid;
    }

    public void setSongid(long songid) {
        this.songid = songid;
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

        SongpersonEntity that = (SongpersonEntity) o;

        if (songid != that.songid) return false;
        if (personid != that.personid) return false;
        if (role != null ? !role.equals(that.role) : that.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (songid ^ (songid >>> 32));
        result = 31 * result + (int) (personid ^ (personid >>> 32));
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }
}
