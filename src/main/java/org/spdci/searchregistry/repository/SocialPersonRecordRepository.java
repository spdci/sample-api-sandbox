package org.spdci.searchregistry.repository;


import org.spdci.searchregistry.pojo.social.SocialPersonRecord;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SocialPersonRecordRepository extends JpaRepository<SocialPersonRecord, Integer>, JpaSpecificationExecutor<SocialPersonRecord> {


    List<SocialPersonRecord> findAll(Specification<SocialPersonRecord> specification);
}
