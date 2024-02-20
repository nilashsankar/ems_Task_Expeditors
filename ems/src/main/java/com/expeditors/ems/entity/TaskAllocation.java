package com.expeditors.ems.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name="task_allocation")
public class TaskAllocation {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name="task_id", referencedColumnName = "id")
    private Task task;

    @ManyToOne()
    @JoinColumn(name="developer_id", referencedColumnName = "id")
    private User developer;

    @ManyToOne
    @JoinColumn(name="assigned_by",referencedColumnName = "id")
    private User managers;

    @Column(name="assigned_at")
    private LocalDateTime assignedAt;
    @Column(name="status")
    private String status;

}
