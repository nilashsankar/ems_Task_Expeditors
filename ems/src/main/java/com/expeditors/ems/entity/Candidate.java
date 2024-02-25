package com.expeditors.ems.entity;

import jakarta.annotation.Generated;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import javax.lang.model.element.Element;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name="candidate")
public class Candidate {
    @Id
    @Column(name = "id")
    private Long id;
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
    @Column(name="scheduled_at")
    private LocalDateTime scheduledTime;

}
