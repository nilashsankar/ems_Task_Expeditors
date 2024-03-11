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
@Table(name="expense_status")
public class ExpenseStatus {
    @Id
    @Column(name="id")
    private Long id;
    @Column(name="status")
    private String status;
}
