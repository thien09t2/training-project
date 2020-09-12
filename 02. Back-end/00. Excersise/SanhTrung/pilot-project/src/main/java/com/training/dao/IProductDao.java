package com.training.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.training.entity.BrandEntity;
import com.training.entity.ProductEntity;

@Repository
public interface IProductDao extends JpaRepository<ProductEntity, Long>, JpaSpecificationExecutor<ProductEntity>{

	ProductEntity findByProductName(String productName);

	ProductEntity findByProductId(Long productId);

	ProductEntity findByProductNameAndProductIdNot(String productName, Long productId);

	@Query(value = "SELECT p"
					+ " FROM ProductEntity p JOIN BrandEntity b ON p.brandEntity.brandId = b.brandId " 
					+ " WHERE (p.productName LIKE %:keyword% OR b.brandName LIKE %:keyword%)"
					+ " AND (p.price BETWEEN :priceFrom AND :priceTo)")
	Page<ProductEntity> searchProductByNameAndPrice(@Param("keyword") String keyword,@Param("priceFrom") Double priceFrom, 
			   @Param("priceTo") Double priceTo, Pageable pageable);
	
	
	@Query(value = "SELECT p "
				   + " FROM ProductEntity p JOIN BrandEntity  b ON p.brandEntity.brandId = b.brandId "
				   + " WHERE p.productName LIKE %:keyword% OR b.brandName LIKE %:keyword% ")
	Page<ProductEntity> searchProductByName(@Param("keyword") String keyword, Pageable pageable);
	
	@Query(value = "SELECT p"
					+ " FROM ProductEntity p JOIN BrandEntity b ON p.brandEntity.brandId = b.brandId"
					+ " WHERE b.brandName LIKE %:brandName% ")
	Page<ProductEntity> findProductBySelect(Map<String, Object> brandName, Pageable pageable);
	
	
	/*
	 * Get search condition use query search product
	 * 
	 * @param searchConditionMap
	 * @return Spectification<ProductEntity>
	 */
	
	public static Specification<ProductEntity> getSearchCondition(Map<String, Object> searchConditionsMap ) {
		return new Specification<ProductEntity>() {
			
			private static final long serialVersionUID = 1L;
			
			@Override
			public Predicate toPredicate(Root<ProductEntity> productRoot, CriteriaQuery<?> query,
					CriteriaBuilder criteriaBuilder) {

				List<Predicate> predicates = new ArrayList<Predicate>();
				if ( searchConditionsMap != null ) {
					String searchText = (String) searchConditionsMap.get("keyword");
					String priceFrom = (String) searchConditionsMap.get("priceFrom");
					String priceTo = (String) searchConditionsMap.get("priceTo");
					@SuppressWarnings("unchecked")
					List<String> brandIds = (List<String>) searchConditionsMap.get("listBrandId");
					Join<ProductEntity, BrandEntity> brandRoot = productRoot.join("brandEntity");
					if (StringUtils.isNotEmpty(searchText)) {
						predicates.add(criteriaBuilder.or(
								criteriaBuilder.like(productRoot.get("productName"), "%" + searchText + "%"),
								criteriaBuilder.like(brandRoot.get("brandName"), "%" + searchText +  "%")
								));
					}
					if (StringUtils.isNotEmpty(priceFrom)) {
						predicates.add(criteriaBuilder.greaterThanOrEqualTo(productRoot.get("price"), Double.parseDouble(priceFrom)));
					}
					if (StringUtils.isNotEmpty(priceTo)) {
						predicates.add(criteriaBuilder.lessThanOrEqualTo(productRoot.get("price"), Double.parseDouble(priceTo)));
					}
					
					if (!CollectionUtils.isEmpty(brandIds)) {
						List<Predicate> listPredicateBrandId = new ArrayList<Predicate>();
						for (String brandId : brandIds) {
							listPredicateBrandId.add(criteriaBuilder.equal(brandRoot.get("brandId"), Long.parseLong(brandId)));
						}
						predicates.add(criteriaBuilder.or(listPredicateBrandId.toArray(new Predicate[listPredicateBrandId.size()])));
					}
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
}
