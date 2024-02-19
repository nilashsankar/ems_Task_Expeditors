package com.expeditors.ems.repository;

import com.expeditors.ems.entity.TaskAllocation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskAllocationRespository extends JpaRepository<TaskAllocation,Long> {

}
