package org.spdci.searchregistry.pojo.social;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "address")
@Entity
public class Address {


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
        this.idJsonLD = "Address";
        this.typeJsonLD = "Address";
    }

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

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "address")
    @JsonManagedReference
    @JsonProperty("spdci:geo_location")
    @ToString.Exclude
    private GeoLocation geoLocation;

}
