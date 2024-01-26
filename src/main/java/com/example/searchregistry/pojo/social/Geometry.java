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
@Table(name = "geometry")
@Entity
public class Geometry {
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
        this.idJsonLD = "Geometry";
        this.typeJsonLD = "GeoLocation";

        if(location!= null){
            location.setIdJsonLD("location");
            location.setTypeJsonLD("GeoCoordinate");
        }
    }

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "geometry")
    @JsonManagedReference
    @JsonProperty("spdci:bounds")
    @ToString.Exclude
    private Bounds bounds;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "geometry")
    @JsonManagedReference
    @JsonProperty("spdci:location")
    @ToString.Exclude
    private GeoCoordinate location;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "plus_code_id")
    @JsonBackReference
    @ToString.Exclude
    private PlusCode plusCode;
}
