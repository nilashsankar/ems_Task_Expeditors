package com.expeditors.ems.repository;

import com.expeditors.ems.entity.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task,Long> {

}
