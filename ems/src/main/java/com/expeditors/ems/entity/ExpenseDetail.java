package com.expeditors.ems.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name="expense_detail")
public class ExpenseDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @ManyToOne()
    @JoinColumn(name="user_id",referencedColumnName = "id")
    private User user;

    @ManyToOne()
    @JoinColumn(name="type_id",referencedColumnName = "id")
    private ExpenseType expenseType;

    @ManyToOne()
    @JoinColumn(name="status_id",referencedColumnName = "id")
    private ExpenseStatus expenseStatus;

    @Column(name="spent_at")
    private LocalDateTime spentAt;
    @Column(name="amount")
    private Float amount;
    @Column(name="description")
    private String description;
    @Column(name="accounted_at")
    private LocalDateTime accountedAt;

    @ManyToOne()
    @JoinColumn(name="accounted_by",referencedColumnName = "id")
    private User accountant;

    @Column(name="created_by")
    private LocalDateTime createdAt;
}
