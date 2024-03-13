package com.expeditors.ems.endpoint;


import com.expeditors.ems.dto.request.*;
import com.expeditors.ems.dto.response.BaseResponse;
import com.expeditors.ems.dto.response.BaseResponseWithoutData;
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
    @GetMapping("{id}")
    public BaseResponse getTaskByDeveloper( @PathVariable("id") Long taskDeveloperRequest) {
//        taskService.validateuser(Long.parseLong(request.getHeader("userid")),"Manager");
        return new BaseResponse("Success","Developer tasks displayed", taskService.getTaskByDeveloper(taskDeveloperRequest));
    }

    @PutMapping("/putstatus")
    public BaseResponse putTaskStatus(@RequestBody DeveloperTaskIdRequest developerTaskIdRequest) {
        PutTaskRespone putTaskRespone = taskService.updateTaskStatus(developerTaskIdRequest);
        return new BaseResponse("Success",putTaskRespone.getPutResponse(),putTaskRespone.getCompleteTaskList());
    }
    @PostMapping("/expense")
    public BaseResponseWithoutData postExpenseUser(@RequestBody ExpenseRequest expenseRequest,HttpServletRequest request){
    Long userHeader=Long.parseLong(request.getHeader("userid"));
        taskService.saveExpenseUser(expenseRequest,userHeader);
        return new BaseResponseWithoutData("Success","inserted");
    }
    @GetMapping("/expenseget")
    public BaseResponse getExpenseUser(@RequestBody ExpenseUpdateRq expenseUpdateRq,HttpServletRequest request) {
        Long userHeader=Long.parseLong(request.getHeader("userid"));
        return new BaseResponse("Success",null,taskService.expenseStatusView(expenseUpdateRq));
    }
    @PutMapping("/expenseupdate")
    public BaseResponseWithoutData putExpenseAccountant(@RequestBody ExpenseUpdateRq expenseUpdateRq,HttpServletRequest request){
        Long userHeader = Long.parseLong(request.getHeader("userid"));
        String response = taskService.updateExpenseUser(expenseUpdateRq);
        return new BaseResponseWithoutData("api success",response);
    }
}
