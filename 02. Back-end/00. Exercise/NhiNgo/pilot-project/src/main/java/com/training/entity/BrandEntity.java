package com.training.entity;

import javax.persistence.*;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "BRAND")
public class BrandEntity {

    @Id
    @Column(name = "BRAND_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long brandID;

    @Column(name = "BRAND_NAME", length = 100, nullable = true)
    private String brandName;

    @Column(name = "DESCRIPTION", nullable = true)
    private String description;

    @Column(name = "LOGO", nullable = true)
    private String logo;

    @Transient
    private MultipartFile[] logoFiles;
    
    public BrandEntity() {
    }

    /**
     * @return the brandID
     */
    public Long getBrandID() {
        return brandID;
    }

    /**
     * @param brandID the brandID to set
     */
    public void setBrandID(Long brandID) {
        this.brandID = brandID;
    }

    /**
     * @return the brandName
     */
    public String getBrandName() {
        return brandName;
    }

    /**
     * @param brandName the brandName to set
     */
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the logo
     */
    public String getLogo() {
        return logo;
    }

    /**
     * @param logo the logo to set
     */
    public void setLogo(String logo) {
        this.logo = logo;
    }

    /**
     * @return the logoFiles
     */
	public MultipartFile[] getLogoFiles() {
		return logoFiles;
	}

	
	/**
     * @param logoFiles the logoFiles to set
     */
	public void setLogoFiles(MultipartFile[] logoFiles) {
		this.logoFiles = logoFiles;
	}
    
    
}
