package org.spdci.searchregistry.repository;


import org.spdci.searchregistry.pojo.ibr.PersonRecord;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PersonRecordRepository extends JpaRepository<PersonRecord, Integer>, JpaSpecificationExecutor<PersonRecord> {

    List<PersonRecord> findAll(Specification<PersonRecord> specification);
}