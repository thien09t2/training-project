package com.training.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.training.entity.BrandEntity;

@Repository
public interface IBrandDao extends JpaRepository<BrandEntity, Long> , JpaSpecificationExecutor<BrandEntity> {

	BrandEntity findByBrandId(Long productId);

	BrandEntity findByBrandName(String productName);

	BrandEntity findByBrandNameAndBrandIdNot(String brandName, Long brandId);

	List<BrandEntity> findByBrandNameLike(String brandName);
	
	static Specification<BrandEntity> getSearchCriteria(Map<String, String> searchConditionsMap) {

		return new Specification<BrandEntity>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<BrandEntity> root, CriteriaQuery<?> query,
					CriteriaBuilder criteriaBuilder) {

				List<BrandEntity> brandList = new ArrayList<>();
				if (searchConditionsMap != null) {
					String keyword = searchConditionsMap.get("keyword");
					if (StringUtils.isNotEmpty(keyword)) {
						brandList.add((BrandEntity) criteriaBuilder.or(criteriaBuilder.like(root.get("brandName"), "%" + keyword + "%")));
					}
				}
				//return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
				return criteriaBuilder.and(brandList.toArray(new Predicate[brandList.size()] ));
			}

		
		};
	} 

}
