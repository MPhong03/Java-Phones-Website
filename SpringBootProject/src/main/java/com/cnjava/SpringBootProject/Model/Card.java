package com.cnjava.SpringBootProject.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity()
@Table(name= "card")
public class Card {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cardid")
	private int cardID;
	
	@Column(name ="name")
	private String name;
	
	
	@Column(name = "numbercard" , unique = true)
	private String numbercard;
	
	@Column(name = "month")
	private int month;
	
	@Column(name="year")
	private int year;
	
	@Column(name ="cvv")
	private int cvv;
	
	@Column(name ="money")
	private int money;

	public Card() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Card(int cardID, String name, String numbercard, int month, int year, int cvv, int money) {
		super();
		this.cardID = cardID;
		this.name = name;
		this.numbercard = numbercard;
		this.month = month;
		this.year = year;
		this.cvv = cvv;
		this.money = money;
	}

	public int getCardID() {
		return cardID;
	}

	public void setCardID(int cardID) {
		this.cardID = cardID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumbercard() {
		return numbercard;
	}

	public void setNumbercard(String numbercard) {
		this.numbercard = numbercard;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getCvv() {
		return cvv;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	
	
}
