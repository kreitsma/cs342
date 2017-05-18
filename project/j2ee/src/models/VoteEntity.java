package models;

import javax.persistence.*;

/**
 * Created by kr29 on 5/18/2017.
 */
@Entity
@Table(name = "VOTE", schema = "PROJECT", catalog = "")
@IdClass(VoteEntityPK.class)
public class VoteEntity {
    private long awardid;
    private long studentid;

    @Id
    @Column(name = "AWARDID")
    public long getAwardid() {
        return awardid;
    }

    public void setAwardid(long awardid) {
        this.awardid = awardid;
    }

    @Id
    @Column(name = "STUDENTID")
    public long getStudentid() {
        return studentid;
    }

    public void setStudentid(long studentid) {
        this.studentid = studentid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VoteEntity that = (VoteEntity) o;

        if (awardid != that.awardid) return false;
        if (studentid != that.studentid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (awardid ^ (awardid >>> 32));
        result = 31 * result + (int) (studentid ^ (studentid >>> 32));
        return result;
    }
}
