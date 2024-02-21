package com.expeditors.ems.endpoint;

import com.expeditors.ems.dto.response.BaseResponse;
import com.expeditors.ems.dto.response.BaseResponseWithoutData;
import com.expeditors.ems.dto.request.UserCreateRequest;
import com.expeditors.ems.dto.request.UserUpdateRequest;
import com.expeditors.ems.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserEndpoint {
    @Autowired
    UserService userService;
    @PostMapping
    public BaseResponse postUserDetails(@RequestBody UserCreateRequest userCreateRequest) {
       try{
           userService.saveUser(userCreateRequest);
           return new BaseResponse("Success","user created successfully",null);
       } catch (Exception e) {
           return new BaseResponse("Failed",e.getMessage(), userCreateRequest);
       }
    }
    @GetMapping("/v")
    public BaseResponse getuser(HttpServletRequest request){
        userService.validateuser(Long.parseLong(request.getHeader("userid")),"Admin");
        return new BaseResponse("success","user displayed successfully",userService.getUser());
    }
    @GetMapping
    public BaseResponse getUserDetail(){

            return new BaseResponse("Success","user displayed successfully",userService.getUser());
            //error is handled in GlobalExceptionhandler
        }
    @PutMapping
    public BaseResponseWithoutData updateUser(@RequestBody UserUpdateRequest userUpdateRequest,HttpServletRequest request) {
        userService.validateuser(Long.parseLong(request.getHeader("userid")),"Admin");
        userService.updateUser(userUpdateRequest);
        return new BaseResponseWithoutData("Success","data updated successfully");
    }
}
