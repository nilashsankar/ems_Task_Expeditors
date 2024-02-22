package com.expeditors.ems.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="hiring_status")
public class HiringStatus {
    @Id
    @Column(name="id")
    private Integer id;
    @Column(name="status")
    private String status;
}
