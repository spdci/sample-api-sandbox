package org.spdci.searchregistry.pojo.social;

import java.util.List;

import org.spdci.searchregistry.pojo.IPerson;
import org.spdci.searchregistry.pojo.enums.MaritalStatus;
import org.spdci.searchregistry.pojo.enums.Sex;
import org.spdci.searchregistry.pojo.ibr.Identifier;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PostLoad;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "social_person")
@Entity
public class SocialPerson implements IPerson {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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

	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JsonProperty("spdci:identifier")
	@JoinTable(name = "social_person_identifier", joinColumns = @JoinColumn(name = "social_person_id"), inverseJoinColumns = @JoinColumn(name = "identifier_id"))
	private List<Identifier> identifier;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	@JsonProperty("spdci:sex")
	private Sex sex;

	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JsonProperty("spdci:name")
	@JoinColumn(name = "social_person_id", referencedColumnName = "id")
	private List<SocialName> name;

	@Column(nullable = false)
	@JsonProperty("spdci:birth_date")
	private String birthDate;

	@Enumerated(EnumType.STRING)
	@JsonProperty("spdci:marital_status")
	private MaritalStatus maritalStatus;

	@JsonProperty("spdci:is_disabled")
	private String isDisabled;

	@ManyToOne
	@JoinColumn(name = "disability_identifier_id")
	@JsonProperty("spdci:disability_identifier")
	private Identifier disabilityIdentifier;

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

	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JsonProperty("spdci:address")
	@JoinColumn(name = "social_person_id", referencedColumnName = "id")
	private List<Address> address;

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

	@JsonProperty("spdci:household_size")
	private Integer household_size;

	@JsonProperty("spdci:poverty_score")
	private Integer poverty_score;

	@ManyToOne
	@JoinColumn(name = "parent1_identifier_id")
	@JsonProperty("spdci:parent1_identifier")
	private Identifier parent1Identifier;

	@ManyToOne
	@JoinColumn(name = "parent2_identifier_id")
	@JsonProperty("spdci:parent2_identifier")
	private Identifier parent2Identifier;

	@Column(nullable = false)
	@JsonProperty("spdci:registration_date")
	private String registrationDate;

	@JsonProperty("spdci:last_updated")
	private String lastUpdated;

}
