package com.expeditors.ems.service;

import com.expeditors.ems.dto.request.LoginRequest;
import com.expeditors.ems.dto.response.UserResponse;
import com.expeditors.ems.dto.request.UserCreateRequest;
import com.expeditors.ems.dto.request.UserUpdateRequest;
import com.expeditors.ems.entity.Role;
import com.expeditors.ems.entity.User;
import com.expeditors.ems.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class UserService {
//    @Autowired
//    private DataSource dataSource;
    @Autowired
    private UserRepository userRepository;
    @Transactional
    public void saveUser(UserCreateRequest userCreateRequest) {
        User user = new User();
        user.setName(userCreateRequest.getName());
        user.setEmail(userCreateRequest.getEmail());
        //for setting role_id
        Role role = new Role();
        role.setId(userCreateRequest.getRoleId());
        //setting timeStamp
        user.setCreatedAt(LocalDateTime.now());
        //saving the new role object containing roleId to user obj
        user.setRole(role);

        userRepository.save(user);
    }

    public List<UserResponse> getUser() {

        List<User> users = userRepository.findByRoleNameNot("Admin");
        List<UserResponse> userResponses = new ArrayList<>();
        users.forEach(user -> {
            UserResponse userResponse = new UserResponse();
            userResponse.setId(user.getId());
            userResponse.setName(user.getName());
            userResponse.setEmail(user.getEmail());
            userResponse.setRoleName(user.getRole().getName());
            userResponse.setCreatedAt(user.getCreatedAt());
            userResponses.add(userResponse);
        });
        return userResponses;

//        List<User> userList = userRepository.findAll();
//        List<userResponse> userResponseList = new ArrayList<>();
//        for(User i: userList) {
//            userResponse data = new userResponse();
//
//            data.setId(i.getId());
//            data.setName(i.getName());
//            data.setEmail(i.getEmail());
//
//            Role role = new Role();
//            role=i.getRole();
//
//            data.setRole(role.getName());
//            data.setCreatedAt(i.getCreatedAt());
//
//            userResponseList.add(data);
//        }
//         return userResponseList;
    }
    public void validateuser(Long requestinguserid,String resource){
        User user=this.userRepository.findById(requestinguserid)
                .orElseThrow(()-> new RuntimeException("User not found"));
        if(!user.getRole().getName().equalsIgnoreCase(resource)){
            throw new RuntimeException("unauthorized user");
        }
    }

    public void updateUser(UserUpdateRequest userUpdateRequest) {
        User user=this.userRepository.findById(userUpdateRequest.getId())
                .orElseThrow(()-> new RuntimeException("User not found"));

        user.setName(userUpdateRequest.getName());
        user.setEmail(userUpdateRequest.getEmail());

        userRepository.save(user);
    }

    public HashMap<String, String> loginUser(LoginRequest loginrequest) {

        HashMap<String, String> loginResponseMap = new HashMap<>();
        try {
            User userDetail = userRepository.findByName(loginrequest.getUserName());
            if (userDetail != null && userDetail.getPassword().equals(loginrequest.getPassword())) {
                loginResponseMap.put("auth", "true");
                loginResponseMap.put("token", "A89776HNASDFA");
                loginResponseMap.put("userId", userDetail.getId().toString());
            } else {
                loginResponseMap.put("auth", "false");
                loginResponseMap.put("toke", "");
                loginResponseMap.put("userId", "");
//                throw new RuntimeException("Invalid credentials");
            }
        }
        catch (Exception e){
            throw new RuntimeException("Error in Login",e);
        }
        return loginResponseMap;
    }

}