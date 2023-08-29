package com.cnjava.SpringBootProject.Model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productid")
	private int ProductID;
	
	@Column(name = "productname", length = 255)
	private String ProductName;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "description", length = 2000)
	private String Description;
	
	@Column(name = "imagelink", length = 255)
	private String ImageLink;
	
	@Column(name = "state")
	private String state;
	
	@Column(name = "supples")
	private String supples;
	
	@Column(name = "colors")
	private String colors;
	
	@Column(name = "status")  //0-het hang , 1- con hang
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "categoryid")
	private Category Category;
	
	@ManyToOne
	@JoinColumn(name = "brandid")
	private Brand Brand;
	
	@OneToMany(mappedBy = "product")
	private List<Comment> comments;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Product(int productID, String productName, int price, String description, String imageLink, String state,
			String supples, String colors, int status, com.cnjava.SpringBootProject.Model.Category category,
			com.cnjava.SpringBootProject.Model.Brand brand, List<Comment> comments) {
		super();
		ProductID = productID;
		ProductName = productName;
		this.price = price;
		Description = description;
		ImageLink = imageLink;
		this.state = state;
		this.supples = supples;
		this.colors = colors;
		this.status = status;
		Category = category;
		Brand = brand;
		this.comments = comments;
	}



	public int getProductID() {
		return ProductID;
	}

	public void setProductID(int productID) {
		ProductID = productID;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int Price) {
		price = Price;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getImageLink() {
		return ImageLink;
	}

	public void setImageLink(String imageLink) {
		ImageLink = imageLink;
	}

	public Category getCategory() {
		return Category;
	}

	public void setCategory(Category category) {
		Category = category;
	}

	public Brand getBrand() {
		return Brand;
	}

	public void setBrand(Brand brand) {
		Brand = brand;
	}
	
	public void addImageUrl(String imageUrl) {
        if (this.ImageLink == null || this.ImageLink.isEmpty()) {
            this.ImageLink = imageUrl;
        } else {
            this.ImageLink += ";" + imageUrl;
        }
    }
	
	public String getFirstImageUrl() {
        if (this.ImageLink != null && !this.ImageLink.isEmpty()) {
            String[] urls = this.ImageLink.split(";");
            if (urls.length > 0) {
                return urls[0];
            }
        }
        return null;
    }

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSupples() {
		return supples;
	}

	public void setSupples(String supples) {
		this.supples = supples;
	}

	public String getColors() {
		return colors;
	}

	public void setColors(String colors) {
		this.colors = colors;
	}
	
	public void addColor(String newColor) {
        if (colors == null) {
            colors = newColor;
        } else {
            String[] colorArray = colors.split(";");
            for (String color : colorArray) {
                if (color.equalsIgnoreCase(newColor)) {
                    return;
                }
            }
            colors += ";" + newColor;
        }
    }

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
