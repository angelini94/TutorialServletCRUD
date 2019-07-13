package Model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "skills")
public class Skill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "skills_id", nullable = false, unique = true)
    private int id;

    @Column(name = "name", length = 40, nullable = false)
    private String name;

    @ManyToMany(mappedBy = "skills")
    private List<User> users = new ArrayList<User>();

    public Skill(){}

    public Skill(int id, String name){
        this.id = id;
        this.name = name;
    }

    public Skill(Integer skill){
        this.id = skill;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
