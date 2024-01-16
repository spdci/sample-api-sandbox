package com.example.springjsonlddemo.repository;

import com.example.springjsonlddemo.pojo.ibr.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {


//    @Query("SELECT p FROM PersonRecord p WHERE p.identifierType = :type or p.identifierValue = :value or p.givenName= :value")
//    List<PersonRecord> findByIdentifier(@Param("type") String type, @Param("value") String value);


}