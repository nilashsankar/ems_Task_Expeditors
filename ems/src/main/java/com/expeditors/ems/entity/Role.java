package com.expeditors.ems.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="role")
public class Role {
    @Id
    @Column(name="id")
    private Integer id;
    @Column(name="name")
    private String name;

}
