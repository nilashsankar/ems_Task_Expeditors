package com.expeditors.ems.dto.reponse;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class DeveloperTask {
    private Long developerId;
    private String developerName;
    private String email;

    List<TaskReponse> ListOfTasks;

}
