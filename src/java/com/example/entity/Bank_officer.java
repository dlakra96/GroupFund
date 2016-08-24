package com.example.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@NamedQueries({@NamedQuery(name="officer.findbyID",query="select o from Bank_officer o where o.id=:officerID"),
               @NamedQuery(name="officer.find",query="select o from Bank_officer o where o.username=:user_name and o.password=:user_pass")})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"uname","pass"}))
public class Bank_officer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
@Pattern(regexp = "((SA)|(FD)|(LO)|(CA)|(DC)|(CC))([0-9]{4})",message = "ID entered is not a valid ID")
    @NotBlank(message = "cannot be left as blank")
            private String id;
    @NotBlank(message = "cannot be left as blank")
    private String name;
    @Column(name="uname")
    @NotBlank(message = "cannot be left as blank")
    private String username;
@Column(name="pass")    
@Size(min=6,max=15,message = "length of password must lie between 6 to 15 characters")    
    @NotBlank(message = "cannot be left as blank")
private String password;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        
        if (!(object instanceof Bank_officer)) {
            return false;
        }
        Bank_officer other = (Bank_officer) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }
@Override
    public String toString() {
        return "com.example.entity.Bank_officer[ id=" + id + " ]";
    }


}
