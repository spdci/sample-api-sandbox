package org.spdci.searchregistry.repository;


import org.spdci.searchregistry.pojo.social.SocialPerson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SocialPersonRepository extends JpaRepository<SocialPerson, Integer> {
}
