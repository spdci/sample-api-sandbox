package com.example.searchregistry.pojo.ibr;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "benefit")
@Entity
public class Benefit {

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

    @PostLoad
    private void postLoad() {
        this.idJsonLD = "Benefit";
        this.typeJsonLD = "Benefit";
    }

    @JsonProperty("spdci:benefit_type")
    private String benefitType;

    @JsonProperty("spdci:benefit_date")
    @Column(name = "benefit_date")
    private String benefitDate;

    @JsonProperty("spdci:benefit_value")
    private String benefitValue;
}
