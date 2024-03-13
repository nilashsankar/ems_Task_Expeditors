package com.expeditors.ems.repository;

import com.expeditors.ems.entity.ExpenseDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ExpenseDetailsRepository extends JpaRepository<ExpenseDetail,Long> {
    List<ExpenseDetail> findAllByUserId(Long l);
    @Transactional
    @Modifying
    @Query(value = "update expense_detail set status_id=?2 where id=?1",nativeQuery = true)
    int UpdateExpensestatusId(Long expenseId, Long statusId);


//    @Query(value = "select e from expense_detail e where e.user=3")
//    List<ExpenseDetail> findAllByUserId(Long id);


}

