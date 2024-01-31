package org.spdci.searchregistry.pojo.ibr;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

import org.spdci.searchregistry.pojo.IPerson;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "person")
@Entity
public class Person implements IPerson {

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
        this.idJsonLD = "Person";
        this.typeJsonLD = "Person";
    }

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JsonProperty("spdci:identifier")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Identifier> identifier;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "person")
    @JsonManagedReference
    @JsonProperty("spdci:name")
    @ToString.Exclude
    private Name name;

    @JsonProperty("spdci:household_status")
    private String householdStatus;

    @JsonProperty("spdci:benefiting_entity")
    private String benefitingEntity;

    @JsonProperty("spdci:sex")
    private String sex;

    @JsonProperty("spdci:birth_date")
    private String birthDate;

    @JsonProperty("spdci:sub_region_code")
    private String subRegionCode;

    @JsonProperty("spdci:marital_status")
    private String maritalStatus;

//    @JsonProperty("spdci:poverty_score")
//    private String povertyScore;

    @JsonProperty("spdci:is_disabled")
    private String isDisabled;

    @JsonProperty("spdci:household_identifier")
    private String householdIdentifier;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JsonProperty("spdci:programme")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Programme> programme;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JsonProperty("spdci:benefit")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Benefit> benefit;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JsonProperty("spdci:payroll")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Payroll> payroll;

}

