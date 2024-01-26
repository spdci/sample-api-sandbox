package com.example.searchregistry.pojo.social;


import com.example.searchregistry.pojo.enums.MaritalStatus;
import com.example.searchregistry.pojo.enums.Sex;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "social_person_view")
@Entity
public class SocialPersonRecord {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @JsonProperty("identifier_type")
    private String identifierType;

    @JsonProperty("identifier_value")
    private String identifierValue;

    @JsonProperty("surname")
    private String surname;

    @JsonProperty("given_name")
    private String givenName;

    @JsonProperty("second_name")
    private String secondName;

    @JsonProperty("maiden_name")
    private String maidenName;

    @JsonProperty("prefix")
    private String prefix;

    @JsonProperty("suffix")
    private String suffix;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @JsonProperty("spdci:sex")
    private Sex sex;

    @Column(nullable = false)
    @JsonProperty("spdci:birth_date")
    private String birthDate;

    @Enumerated(EnumType.STRING)
    @JsonProperty("spdci:marital_status")
    private MaritalStatus maritalStatus;

    @JsonProperty("spdci:is_disabled")
    private String isDisabled;

    @Transient
    @JsonProperty("spdci:disability_type")
    private List<String> disabilityType;

    @Transient
    @JsonProperty("spdci:functional_limitation_type")
    private List<String> functionalLimitationType;

    @Transient
    @JsonProperty("spdci:functional_severity")
    private List<String> functionalSeverity;

    @Transient
    @JsonProperty("spdci:nationality")
    private List<String> nationality;

    @JsonProperty("spdci:employment_status")
    private String employmentStatus;

    @JsonProperty("spdci:is_deceased")
    private String isDeceased;

    @JsonProperty("spdci:death_date")
    private String deathDate;

    @Transient
    @JsonProperty("spdci:ethnicity")
    private List<String> ethnicity;


    @JsonProperty("spdci:address_line1")
    private String addressLine1;

    @JsonProperty("spdci:address_line2")
    private String addressLine2;

    @JsonProperty("spdci:locality")
    private String locality;

    @JsonProperty("spdci:sub_region_code")
    private String subRegionCode;

    @JsonProperty("spdci:region_code")
    private String regionCode;

    @JsonProperty("spdci:postal_code")
    private String postalCode;

    @JsonProperty("spdci:country_code")
    private String countryCode;

    @JsonProperty("spdci:global_code")
    private String globalCode;
//
//    @JsonProperty("spdci:latitude")
//    private Long latitude;
//
//    @JsonProperty("spdci:longitude")
//    private Long longitude;

    @Transient
    @JsonProperty("spdci:phone_number")
    private List<String> phoneNumber;

    @Transient
    @JsonProperty("spdci:email")
    private List<String> email;

    @Column(nullable = false)
    @JsonProperty("spdci:household_identifier")
    private String householdIdentifier;

    @JsonProperty("spdci:household_status")
    private String householdStatus;

//    @JsonProperty("spdci:poverty_score")
//    private int povertyScore;

    @Column(nullable = false)
    @JsonProperty("spdci:registration_date")
    private String registrationDate;

    @JsonProperty("spdci:last_updated")
    private String lastUpdated;
}
