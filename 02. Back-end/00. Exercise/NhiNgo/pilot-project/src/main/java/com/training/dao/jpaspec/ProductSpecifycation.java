package com.training.dao.jpaspec;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import com.training.entity.BrandEntity;
import com.training.entity.ProductEntity;

public class ProductSpecifycation {

	/**
	 * Get search criteria for query to get result list of products in table
	 *
	 *@param searchConditionMap
	 *@return Specification<ProductEntity>
	 */
	public static Specification<ProductEntity> getSearchCriteria(Map<String, Object> searchConditionMap) {
		
		return new Specification<ProductEntity>() {
			
			private static final long serialVersionUID = 1L;
			
			@Override
			public Predicate toPredicate(Root<ProductEntity> prodRoot, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();

				if (searchConditionMap != null) {
					String keyword = (String) searchConditionMap.get("keyword");
					String priceFrom = (String) searchConditionMap.get("priceFrom");
					String priceTo = (String) searchConditionMap.get("priceTo");
					//Join tables
					Join<ProductEntity, BrandEntity> brandRoot = prodRoot.join("brandEntity");

					//Add keyword
					if (StringUtils.isNotEmpty(keyword)) {
						
						
						//Add criteria for predicates
						predicates.add(cb.or(
								cb.like(prodRoot.get("productName"), "%" + keyword + "%"),
								cb.like(brandRoot.get("brandName"), "%" + keyword + "%")
								));
					} 
					
					//Add priceFrom, possible to be empty
					if (StringUtils.isNotEmpty(priceFrom)) {
						
						predicates.add(cb.greaterThanOrEqualTo(prodRoot.get("price"), priceFrom));
					}
					
					//Add priceTo, possible to be empty
					if (StringUtils.isNotEmpty(priceTo)) {
						
						predicates.add(cb.lessThanOrEqualTo(prodRoot.get("price"), priceTo));
					}
				}

				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}

		};
		
	}
}
