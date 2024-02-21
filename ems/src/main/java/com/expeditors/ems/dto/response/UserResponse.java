package com.expeditors.ems.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class UserResponse {
    private Long id;
    private String name;
    private String email;
    private String roleName;
    private LocalDateTime createdAt;
}
