package models;

/**
 * 
 * @author Allari Edoardo
 * @version 1.0.0 - 14/03/2020
 * 
 */

public class Utente{


    private long Id;

    private String Username;

    private String Password;

    private String Email;

    private String SALT;

    private String Roles;

    public Utente() {
    }

    public Utente(long id, String username, String password, String email, String sALT, String roles) {
        this.Id = id;
        this.Username = username;
        this.Password = password;
        this.Email = email;
        this.SALT = sALT;
        this.Roles = roles;
    }

    public long getId() {
        return Id;
    }

    public void setId(long id) {
        Id = id;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getSALT() {
        return SALT;
    }

    public void setSALT(String SALT) {
        this.SALT = SALT;
    }

    public String getRoles() {
        return Roles;
    }

    public void setRoles(String roles) {
        Roles = roles;
    }
}
