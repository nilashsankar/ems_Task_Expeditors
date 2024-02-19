package com.expeditors.ems.repository;

import com.expeditors.ems.entity.TaskAllocation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<TaskAllocation,Long> {
}
