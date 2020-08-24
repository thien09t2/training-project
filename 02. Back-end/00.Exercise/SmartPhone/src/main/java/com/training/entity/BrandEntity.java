package com.training.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "brand")
public class BrandEntity {
	
	@Id
	@Column(name = "brand_id", nullable = false)
	@GeneratedValue (strategy = GenerationType.AUTO)
	private Long brandId;
	
	@Column(name = "brand_name" , nullable = true)
	private String brandName;
	
	@Column(name = "logo" , nullable = true)
	private String logo;
	
	@Column(name = "description" , nullable = true)
	private String description;
	
	@Transient
	private MultipartFile[] logoFiles; 
	
	public Long getBrandId() {
		return brandId;
	}

	public void setBrandId(Long brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public MultipartFile[] getLogoFiles() {
		return logoFiles;
	}

	public void setLogoFiles(MultipartFile[] logoFiles) {
		this.logoFiles = logoFiles;
	}

	

	
	
	
}
