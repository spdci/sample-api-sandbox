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
@Entity
@Table(name = "payroll")
public class Payroll {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonIgnore
    private int id;

    @JsonProperty("spdci:payroll_amount")
    private String payrollAmount;

    @JsonProperty("spdci:payment_credit_date")
    private String paymentCreditDate;

    @JsonProperty("spdci:payment_credit_amount")
    private String paymentCreditAmount;

    @JsonProperty("spdci:payment_charges")
    private String paymentCharges;

    @JsonProperty("spdci:payment_status")
    private String paymentStatus;
}
