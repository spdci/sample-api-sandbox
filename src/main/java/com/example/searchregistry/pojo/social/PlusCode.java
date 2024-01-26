package com.example.searchregistry.pojo.social;
import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Table(name = "plus_code")
@Entity
public class PlusCode {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonIgnore
    private int id;

    @JsonProperty("spdci:global_code")
    private String globalCode;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "plusCode")
    @JsonManagedReference
    @JsonProperty("spdci:geometry")
    @ToString.Exclude
    private Geometry geometry;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "geo_location_id")
    @JsonBackReference
    @ToString.Exclude
    private GeoLocation geoLocation;

}
