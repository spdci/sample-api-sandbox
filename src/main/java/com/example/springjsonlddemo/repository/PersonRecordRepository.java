package com.example.springjsonlddemo.repository;

import com.example.springjsonlddemo.dto.PersonRecord;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PersonRecordRepository extends JpaRepository<PersonRecord, Integer>, JpaSpecificationExecutor<PersonRecord> {


    @Query("SELECT p FROM PersonRecord p WHERE p.identifierType = :type or p.identifierValue = :value or p.givenName= :value")
    List<PersonRecord> findByIdentifier(@Param("type") String type, @Param("value") String value);


    @Query("SELECT p.id FROM PersonRecord p WHERE p.identifierType = :type or p.identifierValue = :value or p.givenName= :value")
    List<Integer> findByIdentifierId(@Param("type") String type, @Param("value") String value);

    @Query("SELECT p.id FROM PersonRecord p WHERE  :type = :value")
    List<Integer> findIdsByTypeAndValue(@Param("type") String type, @Param("value") String value);

    List<PersonRecord> findAll(Specification<PersonRecord> specification);
}