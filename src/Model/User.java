package Model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table (name = "users",
        uniqueConstraints = {@UniqueConstraint(columnNames = {"firstname", "lastname"})}
        )
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", nullable = false, unique = true)
    private Integer id;

    @Column(name = "firstname", length = 40, nullable = false)
    private String firstname;

    @Column(name = "lastname", length = 40, nullable = false)
    private String lastname;

    @Column(name = "country", length = 40, nullable = true)
    private String country;

    @Column(name = "birth_date", length = 40, nullable = false)
    private String birth_date;

    @ManyToOne
    @JoinColumn(name = "fk_role")
    private Role role;

    @ManyToOne
    @JoinColumn(name = "fk_status")
    private Status status;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "users_skills",
    joinColumns = { @JoinColumn(name = "fk_user")},
    inverseJoinColumns = { @JoinColumn(name = "fk_skill")})
    private List<Skill> skills = new ArrayList<Skill>();


    public User(){}

    public User(Integer id){
        this.id = id;
    }

    public User(String fn, String ln, String country, String birth_date, Status status, Role role, List<Skill> skills){
        this.firstname=fn;
        this.lastname=ln;
        this.country=country;
        this.birth_date=birth_date;
        this.status=status;
        this.role=role;
        this.skills= skills;
    }

    public User(String fn, String ln, String country, String birth_date){
        this.firstname=fn;
        this.lastname=ln;
        this.country=country;
        this.birth_date=birth_date;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(String birth_date) {
        this.birth_date = birth_date;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public List<Skill> getSkills() {
        return skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
    }
}

