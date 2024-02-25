package com.expeditors.ems.dto.request;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CreateCandidateRequest {
    private Long id;
    private String name;
    private String email;
    private Long interviewerId;
    private Long statusId;
}
