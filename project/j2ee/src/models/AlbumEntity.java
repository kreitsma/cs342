package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/9/2017.
 */
@Entity
@Table(name = "ALBUM", schema = "PROJECT", catalog = "")
public class AlbumEntity {
    private long id;
    private String name;
    private Long yearnominated;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "YEARNOMINATED")
    public Long getYearnominated() {
        return yearnominated;
    }

    public void setYearnominated(Long yearnominated) {
        this.yearnominated = yearnominated;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AlbumEntity that = (AlbumEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (yearnominated != null ? !yearnominated.equals(that.yearnominated) : that.yearnominated != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (yearnominated != null ? yearnominated.hashCode() : 0);
        return result;
    }
}
