package com.expeditors.ems.entity;

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

    @Column(name = "password")
    private String password;

//    @Fetch(FetchMode.SUBSELECT)
//    @OneToMany(mappedBy = "student", targetEntity = TaskAllocation.class, //mapping is object of the studentfee entity
//            fetch= FetchType.EAGER,cascade = CascadeType.ALL)
//    List<TaskAllocation> taskAllocationList;
}
