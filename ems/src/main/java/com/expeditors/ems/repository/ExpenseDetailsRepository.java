package com.expeditors.ems.repository;

import com.expeditors.ems.entity.ExpenseDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpenseDetailsRepository extends JpaRepository<ExpenseDetail,Long> {

}
