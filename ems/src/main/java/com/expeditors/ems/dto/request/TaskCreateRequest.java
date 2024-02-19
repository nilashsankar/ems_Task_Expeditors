package com.expeditors.ems.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TaskCreateRequest {
    private String taskName;
    private String taskDescrip;
    private Long createdBy;

}
