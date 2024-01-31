package org.spdci.searchregistry.pojo.ibr;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "identifier")
@Entity
public class Identifier {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonIgnore
    private int id;

    @JsonProperty("@id")
    @Transient
    private String idJsonLD;

    @JsonProperty("@type")
    @Transient
    private String typeJsonLD;

    @JsonProperty("spdci:identifier_type")
    private String identifierType;

    @JsonProperty("spdci:identifier_value")
    private String identifierValue;

    @PostLoad
    private void postLoad() {
        this.idJsonLD = "Identifier";
        this.typeJsonLD = "Identifier";
    }
}
