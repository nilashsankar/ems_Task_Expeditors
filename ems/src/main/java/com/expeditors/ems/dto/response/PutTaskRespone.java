package com.expeditors.ems.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
public class PutTaskRespone {
    private String putResponse;
    List<TaskReponse> CompleteTaskList ;
}
