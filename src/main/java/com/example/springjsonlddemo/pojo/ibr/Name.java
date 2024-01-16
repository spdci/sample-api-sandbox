package com.example.springjsonlddemo.pojo.ibr;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
@Table(name = "names")
@Entity
public class Name {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonIgnore
    private int id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "person_id")
    @JsonBackReference
    @ToString.Exclude
    private Person person;

    @JsonProperty("spdci:surname")
    private String surname;

    @JsonProperty("spdci:given_name")
    private String givenName;

    @JsonProperty("spdci:second_name")
    private String secondName;

    @JsonProperty("spdci:maiden_name")
    private String maidenName;

    @JsonProperty("spdci:prefix")
    private String prefix;

    @JsonProperty("spdci:suffix")
    private String suffix;
}
