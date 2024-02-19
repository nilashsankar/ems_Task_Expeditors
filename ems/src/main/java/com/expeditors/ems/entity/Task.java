package com.expeditors.ems.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.time.LocalDateTime;
import java.util.List;

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
    @ManyToOne
    @JoinColumn(name="created_by",referencedColumnName = "id")
    private User users;

//    @Fetch(FetchMode.SUBSELECT)
//    @OneToMany(mappedBy = "student", targetEntity = TaskAllocation.class, //mapping is object of the studentfee entity
//            fetch= FetchType.EAGER,cascade = CascadeType.ALL)
//
//    private List<TaskAllocation> taskAllocationList;
}
