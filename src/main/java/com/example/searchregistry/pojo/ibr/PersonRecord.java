package com.example.searchregistry.pojo.ibr;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.*;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "person_view")
@Entity
public class PersonRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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

    @JsonProperty("household_status")
    private String householdStatus;

    @JsonProperty("benefiting_entity")
    private String benefitingEntity;

    @JsonProperty("sex")
    private String sex;

    @JsonProperty("birth_date")
    private String birthDate;

    @JsonProperty("sub_region_code")
    private String subRegionCode;

    @JsonProperty("marital_status")
    private String maritalStatus;

//    @JsonProperty("poverty_score")
//    private String povertyScore;

    @JsonProperty("is_disabled")
    private String isDisabled;

    @JsonProperty("household_identifier")
    private String householdIdentifier;

    @JsonProperty("programme_name")
    private String programmeName;

    @JsonProperty("programme_identifier")
    private String programmeIdentifier;

    @JsonProperty("registration_date")
    private String registrationDate;

    @JsonProperty("enrolment_date")
    private String enrolmentDate;

    @JsonProperty("suspension_date")
    private String suspensionDate;

    @JsonProperty("graduation_date")
    private String graduationDate;

    @JsonProperty("enrolment_status")
    private String enrolmentStatus;

    @JsonProperty("benefit_type")
    private String benefitType;

    @JsonProperty("benefit_date")
    private String benefitDate;

    @JsonProperty("benefit_value")
    private String benefitValue;

    @JsonProperty("payroll_amount")
    private String payrollAmount;

    @JsonProperty("payment_credit_date")
    private String paymentCreditDate;

    @JsonProperty("payment_credit_amount")
    private String paymentCreditAmount;

    @JsonProperty("payment_charges")
    private String paymentCharges;

    @JsonProperty("payment_status")
    private String paymentStatus;

}

