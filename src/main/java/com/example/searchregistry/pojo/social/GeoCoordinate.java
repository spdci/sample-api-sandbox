package com.example.searchregistry.pojo.social;
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
@Table(name = "geo_coordinate")
@Entity
public class GeoCoordinate {

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

    @JsonProperty("spdci:latitude")
    private Double latitude;

    @JsonProperty("spdci:longitude")
    private Double longitude;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "geometry_id")
    @JsonBackReference
    @ToString.Exclude
    private Geometry geometry;

}
