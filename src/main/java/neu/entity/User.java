package neu.entity;

import java.util.List;
import java.util.Stack;

public class User {
    private long id;
    private String picture;
    private String name;
    private int studentid;
    private String username;
    private String mailbox;
    private String password;
    private String profession;
    private String telnumber;
    private String birth;
    private String gender;
    private String school;
    private List<Activity> useractivities;
    private List<Community> usercommunities;
    private List<JoiningAssn> userjoiningassns;

    public long getId() {
        return id;
    }

    public void setId(long ID) {
        this.id = ID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMailbox() {
        return mailbox;
    }

    public void setMailbox(String mailbox) {
        this.mailbox = mailbox;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getTelnumber() {
        return telnumber;
    }

    public void setTelnumber(String telnumber) {
        this.telnumber = telnumber;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStudentid() {
        return studentid;
    }

    public void setStudentid(int studentid) {
        this.studentid = studentid;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }


    public List<Activity> getUseractivities() {
        return useractivities;
    }

    public void setUseractivities(List<Activity> useractivities) {
        this.useractivities = useractivities;
    }

    public List<Community> getUsercommunities() {
        return usercommunities;
    }

    public void setUsercommunities(List<Community> usercommunities) {
        this.usercommunities = usercommunities;
    }

    public List<JoiningAssn> getUserjoiningassns() {
        return userjoiningassns;
    }

    public void setUserjoiningassns(List<JoiningAssn> userjoiningassns) {
        this.userjoiningassns = userjoiningassns;
    }

    @Override
    public String toString() {
        return "User{" +
                "ID=" + id +
                ", picture='" + picture + '\'' +
                ", name='" + name + '\'' +
                ", studentid=" + studentid +
                ", username='" + username + '\'' +

                ", mailbox='" + mailbox + '\'' +
                ", password='" + password + '\'' +
                ", profession='" + profession + '\'' +
                ", telnumber='" + telnumber + '\'' +
                ", birth=" + birth +
                ", gender='" + gender + '\'' +
                ", school='" + school + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        return username != null ? username.equals(user.username) : user.username == null;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (username != null ? username.hashCode() : 0);
        return result;
    }
}
