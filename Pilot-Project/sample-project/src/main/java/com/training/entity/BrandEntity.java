package com.training.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "BRAND")
public class BrandEntity {

	@Id
	@Column(name = "BRAND_ID", nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long brandId;

	@Column(name = "BRAND_NAME", length = 100, nullable = true)
	private String brandName;

	@Column(name = "DESCRIPTION", nullable = true)
	private String description;

	@Column(name = "LOGO", nullable = true)
	private String logo;
	
	//taọ 1 local file để tải file ảnh lên mà k phải mapping vs db
	@Transient
	private MultipartFile[] logoFiles;
	
	@JsonIgnore
	@OneToMany(mappedBy = "brandEntity", fetch = FetchType.LAZY)
	private Set<ProductEntity> productSet;
	
	
	public BrandEntity() {
	}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public MultipartFile[] getLogoFiles() {
		return logoFiles;
	}

	public void setLogoFiles(MultipartFile[] logoFiles) {
		this.logoFiles = logoFiles;
	}

	public Set<ProductEntity> getProductSet() {
		return productSet;
	}

	public void setProductSet(Set<ProductEntity> productSet) {
		this.productSet = productSet;
	}
	
	
}