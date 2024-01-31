package org.spdci.searchregistry.pojo.social;
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
@Table(name = "bounds")
@Entity
public class Bounds {
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

    @ManyToOne
    @JoinColumn(name = "northeast_id")
    @JsonProperty("spdci:northeast")
    private GeoCoordinate northeast;

    @ManyToOne
    @JoinColumn(name = "southwest_id")
    @JsonProperty("spdci:southwest")
    private GeoCoordinate southwest;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "geometry_id")
    @JsonBackReference
    @ToString.Exclude
    private Geometry geometry;

    @PostLoad
    private void postLoad() {
        this.idJsonLD = "Bounds";
        this.typeJsonLD = "geometry";

        if (northeast != null) {
            northeast.setIdJsonLD("northeast");
            northeast.setTypeJsonLD("GeoCoordinate");
        }

        if (southwest != null) {
            southwest.setIdJsonLD("southwest");
            southwest.setTypeJsonLD("GeoCoordinate");
        }
    }
}
