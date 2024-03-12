package com.expeditors.ems.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ExpenseViewResponse {
    private String type;
    private String status;
    private LocalDateTime spentAt;
    private Float amount;
    private String description;
    private LocalDateTime createdAt;

}
