package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/18/2017.
 */
@Entity
@Table(name = "SONG", schema = "PROJECT", catalog = "")
public class SongEntity {
    private long id;
    private String title;
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
    @Column(name = "TITLE")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

        SongEntity that = (SongEntity) o;

        if (id != that.id) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (yearnominated != null ? !yearnominated.equals(that.yearnominated) : that.yearnominated != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (yearnominated != null ? yearnominated.hashCode() : 0);
        return result;
    }
}
