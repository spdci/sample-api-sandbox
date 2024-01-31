package org.spdci.searchregistry.pojo.social;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Embeddable
@Data
public class SocialPersonIdentifierId implements Serializable {

    @Column(name = "social_person_id")
    private int socialPersonId;

    @Column(name = "identifier_id")
    private int identifierId;
}
