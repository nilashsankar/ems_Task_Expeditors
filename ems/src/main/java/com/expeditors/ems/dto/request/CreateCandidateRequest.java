package com.expeditors.ems.dto.request;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CreateCandidateRequest {
    private Integer id;
    private String name;
    private String email;
    private Integer interviewerId;
    private Integer statusId;
}
