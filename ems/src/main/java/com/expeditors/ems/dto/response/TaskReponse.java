package com.expeditors.ems.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
@Getter
@Setter
public class TaskReponse {
    private Long taskId;
    private String taskName;
    private String decrip;
    private LocalDateTime createbAt;
    private String status;
}
