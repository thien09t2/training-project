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
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.CollectionUtils;

import com.training.entity.BrandEntity;
import com.training.entity.ProductEntity;

public class ProductSpecification {

	public static Specification<ProductEntity> getSearchCriteria(Map<String, Object> searchConditionsMap) {

		return new Specification<ProductEntity>() {
			private static final long serialVersionUID = 1L;
			
			@SuppressWarnings("unchecked")
			@Override
			public Predicate toPredicate(Root<ProductEntity> productRoot, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {

				List<Predicate> predicates = new ArrayList<>();
				if (searchConditionsMap != null) {
					String keySearch = (String) searchConditionsMap.get("keyword");
					String priceFrom = (String) searchConditionsMap.get("priceFrom");
					String priceTo = (String) searchConditionsMap.get("priceTo");
					List<String> listBrandIds = (List<String>)searchConditionsMap.get("list");
					Join<ProductEntity, BrandEntity> brandRoot = productRoot.join("brandEntity");
					if (StringUtils.isNotEmpty(keySearch)) {
						predicates.add(criteriaBuilder.or(
								criteriaBuilder.like(productRoot.get("productName"), "%" + keySearch + "%"),
								criteriaBuilder.like(brandRoot.get("brandName"), "%" + keySearch + "%")));
					}
					if (StringUtils.isNotEmpty(priceFrom)) {
						predicates.add(criteriaBuilder.greaterThanOrEqualTo(productRoot.get("price"), Double.parseDouble(priceFrom)));
					}

					if (StringUtils.isNotEmpty(priceTo)) {
						predicates.add(criteriaBuilder.lessThanOrEqualTo(productRoot.get("price"), Double.parseDouble(priceTo)));
					}

					// Brand Predicate
					if (!CollectionUtils.isEmpty(listBrandIds) ) {
						List<Predicate> brandIdPredicateList = new ArrayList<>();
						for (String brandId : listBrandIds) {
							brandIdPredicateList.add(criteriaBuilder.equal(brandRoot.get("brandId"), Long.parseLong(brandId)));
						}
						predicates.add(criteriaBuilder.or(brandIdPredicateList.toArray(new Predicate[brandIdPredicateList.size()])));
					}
				}


				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
}