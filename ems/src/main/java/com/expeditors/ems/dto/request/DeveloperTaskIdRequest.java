package com.expeditors.ems.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeveloperTaskIdRequest {
    private Long developerId;
    private Long taskId;
}
