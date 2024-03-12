package com.expeditors.ems.service;

import com.expeditors.ems.dto.request.*;
import com.expeditors.ems.dto.response.DeveloperTask;
import com.expeditors.ems.dto.response.ExpenseViewResponse;
import com.expeditors.ems.dto.response.PutTaskRespone;
import com.expeditors.ems.dto.response.TaskReponse;
import com.expeditors.ems.entity.*;
import com.expeditors.ems.repository.ExpenseDetailsRepository;
import com.expeditors.ems.repository.TaskAllocationRespository;
import com.expeditors.ems.repository.TaskRepository;
import com.expeditors.ems.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
public class TaskService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TaskRepository taskRepository;
    @Autowired
    TaskAllocationRespository taskAllocationRespository;
    @Autowired
    ExpenseDetailsRepository expenseDetailsRepository;
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

    public DeveloperTask getTaskByDeveloper(Long  taskDeveloperRequest) {
        User users = userRepository.findById(taskDeveloperRequest).get();

        //setting Developer details
        DeveloperTask developerTask = new DeveloperTask();
        developerTask.setDeveloperId(taskDeveloperRequest);
        developerTask.setDeveloperName(users.getName());
        developerTask.setEmail(users.getEmail());

        //getting task_allocation from Database
        List<TaskAllocation> taskAllocationList = taskAllocationRespository.findByDeveloperId(taskDeveloperRequest);

        List<TaskReponse> taskReponseList = new ArrayList<>(); //creating TaskResponse List

        //forEach loop for setting task_details for the specific developer
        // And storing it in TaskReponselist
        taskAllocationList.forEach(taskAllocation -> {
            TaskReponse taskReponse = new TaskReponse();
            taskReponse.setTaskId(taskAllocation.getTask().getTaskId());
            taskReponse.setTaskName(taskAllocation.getTask().getTaskName());
            taskReponse.setDecrip(taskAllocation.getTask().getTaskDescrip());
            taskReponse.setCreatebAt(taskAllocation.getTask().getCreatedAt());
            taskReponse.setStatus(taskAllocation.getStatus());
            taskReponseList.add(taskReponse);
        });

        developerTask.setListOfTasks(taskReponseList);

        return developerTask;
    }
    public List<TaskReponse> completedTask(DeveloperTaskIdRequest developerTaskIdRequest) {
        List <TaskReponse> taskReponseList = new ArrayList<>();
        List<TaskAllocation> taskAllocationList = taskAllocationRespository.findByDeveloperId(developerTaskIdRequest.getDeveloperId());
        taskAllocationList.forEach(taskAllocation -> {
            if(taskAllocation.getStatus().equalsIgnoreCase("Completed")) {
                TaskReponse taskReponse1 = new TaskReponse();
                taskReponse1.setTaskId(taskAllocation.getTask().getTaskId());
                taskReponse1.setTaskName(taskAllocation.getTask().getTaskName());
                taskReponse1.setDecrip(taskAllocation.getTask().getTaskDescrip());
                taskReponse1.setCreatebAt(taskAllocation.getTask().getCreatedAt());
                taskReponse1.setStatus(taskAllocation.getStatus());
                taskReponseList.add(taskReponse1);
            }
        });
        return taskReponseList;
    }
    public PutTaskRespone  updateTaskStatus(DeveloperTaskIdRequest developerTaskIdRequest) {
        //fetching specific task for specific developer
        TaskAllocation taskAllocation = taskAllocationRespository.findByDeveloperIdAndTaskTaskId(developerTaskIdRequest.getDeveloperId(),developerTaskIdRequest.getTaskId());
       //creating obj for the dto response
        PutTaskRespone putTaskRespone = new PutTaskRespone();
        //checking condition for status
        // else adding completed task to a list
        if(taskAllocation.getStatus().equalsIgnoreCase("Incomplete")) {
            taskAllocation.setStatus("Completed");
            putTaskRespone.setPutResponse("Task Updated");
        }
        else { putTaskRespone.setPutResponse("Task already completed");}
        taskAllocationRespository.save(taskAllocation);

        putTaskRespone.setCompleteTaskList(completedTask(developerTaskIdRequest));
        return putTaskRespone;
    }

    private LocalDateTime randomDateTime(){
        long offset = Timestamp.valueOf("2022-01-01 00:00:00").getTime();
        long end = Timestamp.valueOf("2023-01-01 00:00:00").getTime();
        long diff = end - offset + 1;
        Timestamp rand = new Timestamp(offset + (long)(Math.random() * diff));
        return rand.toLocalDateTime();
    }
    private LocalDateTime randomDateTime1(){
        long offset = Timestamp.valueOf("2024-01-01 00:00:00").getTime();
        long end = Timestamp.valueOf("2024-03-12 00:00:00").getTime();
        long diff = end - offset + 1;
        Timestamp rand = new Timestamp(offset + (long)(Math.random() * diff));
        return rand.toLocalDateTime();
    }
    public void saveExpenseUser(ExpenseRequest expenseRequest,Long userHeaderValue){
        ExpenseDetail expenseDetail = new ExpenseDetail();

        User user = new User();
        user.setId(expenseRequest.getUserId());
        expenseDetail.setUser(user);

        ExpenseType expenseType = new ExpenseType();
        expenseType.setId(expenseRequest.getTypeId());
        expenseDetail.setExpenseType(expenseType);

        ExpenseStatus expenseStatus = new ExpenseStatus();
        expenseStatus.setId(expenseRequest.getStatusId());
        expenseDetail.setExpenseStatus(expenseStatus);

        expenseDetail.setSpentAt(randomDateTime());
        expenseDetail.setDescription(expenseRequest.getDescription());
        expenseDetail.setAmount(expenseRequest.getAmount());
        expenseDetail.setAccountedAt(randomDateTime1());

        User accountant = new User();
        accountant.setId(userHeaderValue);
        expenseDetail.setAccountant(accountant);

        expenseDetail.setCreatedAt(LocalDateTime.now());

        expenseDetailsRepository.save(expenseDetail);
    }

    public Object expenseStatusView(ExpenseUpdateRq expenseUpdateRq) {
        List<ExpenseDetail> expenseDetailsOfUser = this.expenseDetailsRepository.findAllByUserId(expenseUpdateRq.getUserId());
        List<ExpenseViewResponse> expenseViewResponseList = new ArrayList<>();

        for(ExpenseDetail exp:expenseDetailsOfUser) {
            ExpenseViewResponse expenseViewResponse = new ExpenseViewResponse();
            expenseViewResponse.setStatus(exp.getExpenseStatus().getStatus());
            expenseViewResponse.setType(exp.getExpenseType().getType());
            expenseViewResponse.setDescription(exp.getDescription());
            expenseViewResponse.setAmount(exp.getAmount());
            expenseViewResponse.setSpentAt(exp.getSpentAt());
            expenseViewResponse.setCreatedAt(exp.getCreatedAt());
            expenseViewResponseList.add(expenseViewResponse);
        }

        return expenseViewResponseList;
    }
}
