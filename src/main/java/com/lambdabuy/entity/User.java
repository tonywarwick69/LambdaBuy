package com.lambdabuy.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Users")
public class User {
	@Id
	@NotEmpty
	private String id;
	
	@Length(min=6)
	private String password;
	

	private String fullname;
	

	
	private int telephone;
	
	private String email;
	
	private String photo;
	
	private Boolean activated;
	
	private int role;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date birthDay;
	

	@JsonIgnore
	@OneToMany(mappedBy = "user")
	private List<Order> orders;
	
	
	@OneToOne(mappedBy = "user")
	private Supplier suppliers;
	
	@OneToMany(mappedBy = "user")
	private List<Cart> carts;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User( String id,  String fullname,  int telephone,
			 String email, String photo, Boolean activated, int role,Date birthDay) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.telephone = telephone;
		this.email = email;
		this.photo = photo;
		this.activated = activated;
		this.role = role;
		this.birthDay=birthDay;
	}
	

	public User(String id,   String password, String fullname,
			 int telephone,  String email, String photo, Boolean activated, int role,Date birthDay) {
		super();
		this.id = id;
		this.password = password;
		this.fullname = fullname;
		this.telephone = telephone;
		this.email = email;
		this.photo = photo;
		this.activated = activated;
		this.role = role;
		this.birthDay=birthDay;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/*
	public void setPassword(String password) {
		BCryptPasswordEncoder passwordEncoder= new BCryptPasswordEncoder();
		this.password = passwordEncoder.encode(password);
	}
	*/
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	public int getTelephone() {
		return telephone;
	}

	public void setTelephone(int telephone) {
		this.telephone = telephone;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	
	public Supplier getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(Supplier suppliers) {
		this.suppliers = suppliers;
	}
	

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}
	public Date getBirthDay() {
		return birthDay;
	}


	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	

}