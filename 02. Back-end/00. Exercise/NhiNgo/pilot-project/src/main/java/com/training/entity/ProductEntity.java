package com.training.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "PRODUCT")
public class ProductEntity {

	@Id
	@Column(name = "PRODUCT_ID", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long productId;

	@Column(name = "PRODUCT_NAME", length = 100, nullable = false)
	private String productName;

	@Column(name = "QUANTITY", nullable = false)
	private Long quantity;

	@Column(name = "PRICE", nullable = false)
	private Double price;

	@JoinColumn(name = "BRAND_ID", referencedColumnName = "BRAND_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private BrandEntity brandEntity;

	@Column(name = "SALE_DATE", nullable = false)
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date saleDate;

	@Column(name = "IMAGE", nullable = false)
	private String prodImg;

	@Transient
	private MultipartFile[] prodImgFiles;

	@Column(name = "DESCRIPTION", nullable = true)
	private String prodDesct;

	public ProductEntity() {
	}

	/**
	 * @param productId
	 */
	public ProductEntity(Long productId) {
		super();
		this.productId = productId;
	}

	/**
	 * @return the productId
	 */
	public Long getProductId() {
		return productId;
	}

	/**
	 * @param productId the productId to set
	 */
	public void setProductId(Long productId) {
		this.productId = productId;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the quantity
	 */
	public Long getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the price
	 */
	public Double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(Double price) {
		this.price = price;
	}

	/**
	 * @return the brandEntity
	 */
	public BrandEntity getBrandEntity() {
		return brandEntity;
	}

	/**
	 * @param brandEntity the brandEntity to set
	 */
	public void setBrandEntity(BrandEntity brandEntity) {
		this.brandEntity = brandEntity;
	}

	/**
	 * @return the saleDate
	 */
//	@JsonSerialize(using = JsonSerializer.class)
	public Date getSaleDate() {
		return saleDate;
	}

	/**
	 * @param saleDate the saleDate to set
	 */
//	@JsonSerialize(using = JsonSerializer.class)
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	/**
	 * @return the prodImg
	 */
	public String getProdImg() {
		return prodImg;
	}

	/**
	 * @param prodImg the prodImg to set
	 */
	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}

	/**
	 * @return the prodImgFiles
	 */
	public MultipartFile[] getProdImgFiles() {
		return prodImgFiles;
	}

	/**
	 * @param prodImgFiles the prodImgFiles to set
	 */
	public void setProdImgFiles(MultipartFile[] prodImgFiles) {
		this.prodImgFiles = prodImgFiles;
	}

	/**
	 * @return the prodDesct
	 */
	public String getProdDesct() {
		return prodDesct;
	}

	/**
	 * @param prodDesct the prodDesct to set
	 */
	public void setProdDesct(String prodDesct) {
		this.prodDesct = prodDesct;
	}

}
