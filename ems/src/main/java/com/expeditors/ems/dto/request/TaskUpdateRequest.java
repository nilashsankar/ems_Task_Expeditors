package com.expeditors.ems.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TaskUpdateRequest {
    private Long taskId;
    private String taskName;
}
