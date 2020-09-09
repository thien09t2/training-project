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

public class ProductJpaSpecification {

	/**
	 * Get search criteria for query to search products
	 * 
	 * @param searchConditionsMap
	 * @return Specification<ProductEntity>
	 */
	public static Specification<ProductEntity> getSearchCriteria(Map<String, Object> searchConditionsMap) {

		return new Specification<ProductEntity>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<ProductEntity> productRoot, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {

				List<Predicate> predicates = new ArrayList<>();
				if (searchConditionsMap != null) {
					String keyword = (String) searchConditionsMap.get("keyword");
					String priceFrom = (String) searchConditionsMap.get("priceFrom");
					String priceTo = (String) searchConditionsMap.get("priceTo");
//					List<String> brandIds = (List<String>) searchConditionsMap.get("brandIds");

					// Keyword
					if (StringUtils.isNotEmpty(keyword)) {
						Join<ProductEntity, BrandEntity> brandRoot = productRoot.join("brandEntity");
						predicates.add(criteriaBuilder.or(
								criteriaBuilder.like(productRoot.get("productName"), "%" + keyword + "%"),
								criteriaBuilder.like(brandRoot.get("brandName"), "%" + keyword + "%"),
								criteriaBuilder.like(productRoot.get("description"), "%" + keyword + "%"),
								criteriaBuilder.like(brandRoot.get("description"), "%" + keyword + "%")
						));
					}

					// Price From
					if (StringUtils.isNotEmpty(priceFrom)) {
						predicates.add(criteriaBuilder.greaterThanOrEqualTo(productRoot.get("price"), Double.parseDouble(priceFrom)));
					}

					// Price To
					if (StringUtils.isNotEmpty(priceTo)) {
						predicates.add(criteriaBuilder.lessThanOrEqualTo(productRoot.get("price"), Double.parseDouble(priceTo)));
					}

					// Brand 
//					if (brandIds != null && brandIds.size() > 0) {
//						Predicate brandIdPredicate = null;
//						for (String brandId : brandIds) {
//							brandIdPredicate = criteriaBuilder.equal(productRoot.get("brandId"), brandId);
//						}
//						predicates.add(criteriaBuilder.or(brandIdPredicate));
//					}
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
}
