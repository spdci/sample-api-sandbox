package com.example.searchregistry.pojo.social;

import com.example.searchregistry.pojo.ibr.Identifier;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "social_person_identifier")
@Data
public class SocialPersonIdentifier {

    @EmbeddedId
    private SocialPersonIdentifierId id;

    @ManyToOne
    @MapsId("socialPersonId")
    @JoinColumn(name = "social_person_id")
    private SocialPerson socialPerson;

    @ManyToOne
    @MapsId("identifierId")
    @JoinColumn(name = "identifier_id")
    private Identifier identifier;

}
