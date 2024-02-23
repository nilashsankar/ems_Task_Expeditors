package com.expeditors.ems.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="candidate")
public class Candidate {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "email")
    private String email;
    @ManyToOne
    @JoinColumn(name = "interviewer_id", referencedColumnName = "id")
    private User Manager;
    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "id")
    private HiringStatus status;
}
