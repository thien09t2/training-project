package com.training.entity;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "PRODUCT")
public class ProductEntity {

    @Id
    @Column(name = "PRODUCT_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long prodID;

    @Column(name = "PRODUCT_NAME", length = 100, nullable = true)
    private String prodName;

    @Column(name = "QUANTITY", nullable = false)
    private Long prodQuantity;

    @Column(name = "PRICE", nullable = false)
    private Double price;

    @Column(name = "BRAND_ID", nullable = false)
    private Long brandID;

    @Column(name = "SALE_DATE", nullable = false)
    private Date saleDate;

    @Column(name = "IMAGE", nullable = true)
    private String prodImg;

    @Transient
    private MultipartFile[] prodImgFiles;

    @Column(name = "DESCRIPTION", nullable = true)
    private String prodDesc;

    public ProductEntity() {
    }

    /**
     * @return the prodID
     */
    public Long getProdID() {
        return prodID;
    }

    /**
     * @param prodID the prodID to set
     */
    public void setProdID(Long prodID) {
        this.prodID = prodID;
    }

    /**
     * @return the prodName
     */
    public String getProdName() {
        return prodName;
    }

    /**
     * @param prodName the prodName to set
     */
    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    /**
     * @return the prodQuantity
     */
    public Long getProdQuantity() {
        return prodQuantity;
    }

    /**
     * @param prodQuantity the prodQuantity to set
     */
    public void setProdQuantity(Long prodQuantity) {
        this.prodQuantity = prodQuantity;
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
     * @return the saleDate
     */
    public Date getSaleDate() {
        return saleDate;
    }

    /**
     * @param saleDate the saleDate to set
     */
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
     * @return the prodDesc
     */
    public String getProdDesc() {
        return prodDesc;
    }

    /**
     * @param prodDesc the prodDesc to set
     */
    public void setProdDesc(String prodDesc) {
        this.prodDesc = prodDesc;
    }
}
