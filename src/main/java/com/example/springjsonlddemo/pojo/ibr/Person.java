package com.example.springjsonlddemo.pojo.ibr;

import com.example.springjsonlddemo.utils.PersonSerializer;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "person")
@Entity
@JsonSerialize(using = PersonSerializer.class)
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonIgnore
    private int id;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JsonProperty("spdci:identifier")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Identifier> identifier;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "person")
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

    @JsonProperty("spdci:poverty_score")
    private String povertyScore;

    @JsonProperty("spdci:is_disabled")
    private String isDisabled;

    @JsonProperty("spdci:household_identifier")
    private String householdIdentifier;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JsonProperty("spdci:programme")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Programme> programme;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JsonProperty("spdci:benefit")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Benefit> benefit;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JsonProperty("spdci:payroll")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private List<Payroll> payroll;

}

