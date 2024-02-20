package com.expeditors.ems.service;

import com.expeditors.ems.entity.TaskAllocation;
import com.expeditors.ems.repository.TaskAllocationRespository;
import com.expeditors.ems.repository.TaskRepository;
import com.expeditors.ems.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeveloperService {
    @Autowired
    TaskAllocationRespository taskAllocationRespository;
    @Autowired
    TaskRepository taskRepository;
    @Autowired
    UserRepository userRepository;


}
