package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/9/2017.
 */
@Entity
@Table(name = "AWARD", schema = "PROJECT", catalog = "")
public class AwardEntity {
    private long id;
    private String category;
    private Long yearreceived;
    private String status;
    private Long votes;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CATEGORY")
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Basic
    @Column(name = "YEARRECEIVED")
    public Long getYearreceived() {
        return yearreceived;
    }

    public void setYearreceived(Long yearreceived) {
        this.yearreceived = yearreceived;
    }

    @Basic
    @Column(name = "STATUS")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "VOTES")
    public Long getVotes() {
        return votes;
    }

    public void setVotes(Long votes) {
        this.votes = votes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AwardEntity that = (AwardEntity) o;

        if (id != that.id) return false;
        if (category != null ? !category.equals(that.category) : that.category != null) return false;
        if (yearreceived != null ? !yearreceived.equals(that.yearreceived) : that.yearreceived != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (votes != null ? !votes.equals(that.votes) : that.votes != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (yearreceived != null ? yearreceived.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (votes != null ? votes.hashCode() : 0);
        return result;
    }
}
