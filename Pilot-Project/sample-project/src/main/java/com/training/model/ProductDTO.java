package com.training.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private long productId;
	private String productName;
	private double price;
	private int quantity;
	private long brandId;
	private Date openForSale;
	private String description;
	private MultipartFile[] productImage;

	public ProductDTO() {
		super();
	}

	public ProductDTO(long productId, String productName, double price, int quantity, long brandId, Date openForSale,
			String description, MultipartFile[] productImage) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
		this.brandId = brandId;
		this.openForSale = openForSale;
		this.description = description;
		this.productImage = productImage;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getBrandId() {
		return brandId;
	}

	public void setBrandId(long brandId) {
		this.brandId = brandId;
	}

	public Date getOpenForSale() {
		return openForSale;
	}

	public void setOpenForSale(Date openForSale) {
		this.openForSale = openForSale;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public MultipartFile[] getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile[] productImage) {
		this.productImage = productImage;
	}

}
