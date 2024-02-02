package org.spdci.searchregistry.pojo.social;

import org.spdci.searchregistry.pojo.ibr.Identifier;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "social_person_identifier")
@Data
public class PersonIdentifier {

    @EmbeddedId
    private PersonIdentifierId id;

    @ManyToOne
    @MapsId("socialPersonId")
    @JoinColumn(name = "social_person_id")
    private SocialPerson socialPerson;

    @ManyToOne
    @MapsId("identifierId")
    @JoinColumn(name = "identifier_id")
    private Identifier identifier;

}
