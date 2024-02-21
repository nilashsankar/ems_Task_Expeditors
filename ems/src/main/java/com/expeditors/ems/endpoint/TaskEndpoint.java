package com.expeditors.ems.endpoint;


import com.expeditors.ems.dto.response.BaseResponse;
import com.expeditors.ems.dto.response.BaseResponseWithoutData;
import com.expeditors.ems.dto.request.DeveloperTaskIdRequest;
import com.expeditors.ems.dto.request.TaskAllocationRequest;
import com.expeditors.ems.dto.request.TaskCreateRequest;
import com.expeditors.ems.dto.request.TaskDeveloperRequest;
import com.expeditors.ems.dto.response.PutTaskRespone;
import com.expeditors.ems.service.TaskService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    @PostMapping("/assign")
    public BaseResponseWithoutData postTaskByDeveloper(@RequestBody TaskAllocationRequest taskAllocationRequest, HttpServletRequest request){
        taskService.validateuser(Long.parseLong(request.getHeader("userid")),"Manager");
        taskService.assignTask(taskAllocationRequest);
        return new BaseResponseWithoutData("Success","Task inserted");
    }
    @GetMapping
    public BaseResponse getTaskByDeveloper(@RequestBody TaskDeveloperRequest taskDeveloperRequest, HttpServletRequest request) {
        taskService.validateuser(Long.parseLong(request.getHeader("userid")),"Manager");
        return new BaseResponse("Success","Developer tasks displayed", taskService.getTaskByDeveloper(taskDeveloperRequest));
    }

    @PutMapping("/putstatus")
    public BaseResponse putTaskStatus(@RequestBody DeveloperTaskIdRequest developerTaskIdRequest) {
        PutTaskRespone putTaskRespone = taskService.updateTaskStatus(developerTaskIdRequest);
        return new BaseResponse("Success",putTaskRespone.getPutResponse(),putTaskRespone.getCompleteTaskList());
    }


}
