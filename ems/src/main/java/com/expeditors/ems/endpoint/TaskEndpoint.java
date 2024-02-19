package com.expeditors.ems.endpoint;

import com.expeditors.ems.dto.reponse.BaseResponseWithoutData;
import com.expeditors.ems.dto.request.TaskAllocationRequest;
import com.expeditors.ems.dto.request.TaskCreateRequest;
import com.expeditors.ems.service.TaskService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/task")
public class TaskEndpoint {
    @Autowired
    TaskService taskService;

    @PostMapping
    public BaseResponseWithoutData postTask(@RequestBody TaskCreateRequest taskCreateRequest, HttpServletRequest request){
        taskService.validateuser(Long.parseLong(request.getHeader("userid")),"Manager");
        taskService.saveTask(taskCreateRequest);
        return new BaseResponseWithoutData("Success","Task inserted");
    }
    @PostMapping("/dev")
    public BaseResponseWithoutData postTaskDeveloper(@RequestBody TaskAllocationRequest taskAllocationRequest, HttpServletRequest request){
        taskService.validateuser(Long.parseLong(request.getHeader("userid")),"Manager");
        taskService.assignTask(taskAllocationRequest);
        return new BaseResponseWithoutData("Success","Task inserted");
    }

}
