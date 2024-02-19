package com.expeditors.ems.service;

import com.expeditors.ems.dto.request.TaskAllocationRequest;
import com.expeditors.ems.dto.request.TaskCreateRequest;
import com.expeditors.ems.entity.Task;
import com.expeditors.ems.entity.TaskAllocation;
import com.expeditors.ems.entity.User;
import com.expeditors.ems.repository.TaskAllocationRespository;
import com.expeditors.ems.repository.TaskRepository;
import com.expeditors.ems.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
public class TaskService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TaskRepository taskRepository;
    @Autowired
    TaskAllocationRespository taskAllocationRespository;
    public void validateuser(Long requestinguserid,String resource){
        User user=this.userRepository.findById(requestinguserid)
                .orElseThrow(()-> new RuntimeException("Manager not found"));
        if(!user.getRole().getName().equalsIgnoreCase(resource)){
            throw new RuntimeException("unauthorized user");
        }
    }

    public void saveTask(TaskCreateRequest taskCreateRequest) {
        Task task = new Task();
        task.setTaskName(taskCreateRequest.getTaskName());
        task.setTaskDescrip(taskCreateRequest.getTaskDescrip());
        task.setCreatedAt(LocalDateTime.now());
        User users = new User();
        users.setId(taskCreateRequest.getCreatedBy());
        task.setUsers(users);
        taskRepository.save(task);
    }

    public void assignTask(TaskAllocationRequest taskAllocationRequest) {
        TaskAllocation taskAllocation = new TaskAllocation();
        Task task = new Task();
        task.setTaskId(taskAllocationRequest.getTaskId());
        taskAllocation.setTask(task);

        User developer= new User();
        developer.setId(taskAllocationRequest.getUserId());
        taskAllocation.setDeveloper(developer);

        User manager= new User();
        manager.setId(taskAllocationRequest.getAssignedBy());
        taskAllocation.setManagers(manager);

        taskAllocation.setStatus(taskAllocationRequest.getStatus());
        taskAllocation.setAssignedAt(LocalDateTime.now());

        taskAllocationRespository.save(taskAllocation);

    }
}
