package neu.entity;

import java.sql.Timestamp;

/*
* Created by 黄宇航 on 2017/8/3 15:00
* 用于用户申请加入社团的审核类
*/
public class JoiningAssn {
    private long id;
    private long userid;
    private long assnid;
    private Timestamp createtime;
    private Timestamp endtime;
    private int status; /*-2超时,-1拒绝,0未审核,1接受*/

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public long getAssnid() {
        return assnid;
    }

    public void setAssnid(long assnid) {
        this.assnid = assnid;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Timestamp getEndtime() {
        return endtime;
    }

    public void setEndtime(Timestamp endtime) {
        this.endtime = endtime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        JoiningAssn that = (JoiningAssn) o;

        if (id != that.id) return false;
        if (userid != that.userid) return false;
        return assnid == that.assnid;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (userid ^ (userid >>> 32));
        result = 31 * result + (int) (assnid ^ (assnid >>> 32));
        return result;
    }

    public String toString() {
        return "JoiningAssn [id=" + id + ", userid=" + userid + ", assnid=" + assnid + ", createtime="
                + createtime + ", endtime=" + endtime + ", status=" + status + "]";
    }
}
