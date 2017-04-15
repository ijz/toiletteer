package toiletteer.models.rest;

import toiletteer.models.dao.UserDB;

public class UserRest {

    private long id;
    private String name;
    private String email;

    public UserRest(UserDB userDB) {
        this.id = userDB.getId();
        this.name = userDB.getName();
        this.email = userDB.getEmail();
    }

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

}
