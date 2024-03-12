package com.expeditors.ems.repository;

import com.expeditors.ems.entity.ExpenseDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ExpenseDetailsRepository extends JpaRepository<ExpenseDetail,Long> {
    List<ExpenseDetail> findAllByUserId(Long l);


//    @Query(value = "select e from expense_detail e where e.user=3")
//    List<ExpenseDetail> findAllByUserId(Long id);


}

