package com.expeditors.ems.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExpenseRequest {
    private Long userId;
    private Long typeId;
    private Long statusId;
    private Float amount;
    private String description;
}
