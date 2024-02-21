package com.expeditors.ems.repository;

import com.expeditors.ems.entity.TaskAllocation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskAllocationRespository extends JpaRepository<TaskAllocation,Long> {

    List<TaskAllocation> findByDeveloperId(Long developerId);


    TaskAllocation findByDeveloperIdAndTaskTaskId(Long developerId,Long TaskId);
}
