package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by kr29 on 5/9/2017.
 */
public class VoteEntityPK implements Serializable {
    private long awardid;
    private long studentid;

    @Column(name = "AWARDID")
    @Id
    public long getAwardid() {
        return awardid;
    }

    public void setAwardid(long awardid) {
        this.awardid = awardid;
    }

    @Column(name = "STUDENTID")
    @Id
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

        VoteEntityPK that = (VoteEntityPK) o;

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
