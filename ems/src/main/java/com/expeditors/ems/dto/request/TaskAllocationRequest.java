package com.expeditors.ems.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
@Getter
@Setter
public class TaskAllocationRequest {
    private Long taskId;
    private Long userId;
    private Long assignedBy;
    private LocalDateTime assigedAt;
    private String status;
}
