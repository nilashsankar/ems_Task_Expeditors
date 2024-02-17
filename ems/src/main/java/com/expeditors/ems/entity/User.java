package com.expeditors.ems.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name="user_detail")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;
    @Column(name="name")
    private String name;
    @Column(name="email")
    private String email;

    @ManyToOne()
    @JoinColumn(name="role_id",referencedColumnName = "id")
    private Role role;

    @Column(name="created_at")
    private LocalDateTime createdAt;
}
