package com.expeditors.ems.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

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
    private Task taskId;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable()
    private User developerId;

}
