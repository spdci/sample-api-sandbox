package com.example.springjsonlddemo.pojo.ibr;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "programme")
@Entity
public class Programme {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonIgnore
    private int id;

    @JsonProperty("spdci:programme_name")
    private String programmeName;

    @JsonProperty("spdci:programme_identifier")
    private String programmeIdentifier;

    @JsonProperty("spdci:registration_date")
    private String registrationDate;

    @JsonProperty("spdci:enrolment_date")
    private String enrolmentDate;

    @JsonProperty("spdci:suspension_date")
    private String suspensionDate;

    @JsonProperty("spdci:graduation_date")
    private String graduationDate;

    @JsonProperty("spdci:enrolment_status")
    private String enrolmentStatus;
}
