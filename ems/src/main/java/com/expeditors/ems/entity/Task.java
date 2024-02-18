package com.expeditors.ems.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name="task")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long taskId;
    @Column(name="name")
    private String taskName;
    @Column(name="description")
    private String taskDescrip;
    @Column(name="created_at")
    private LocalDateTime createdAt;
    @Column(name="created_by")
    private Long taskCreatedBy;

}
