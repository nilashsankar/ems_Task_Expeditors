package com.expeditors.ems.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExpenseUpdateRq {
    private Long expenseId;
    private Long userId;
    private Long statusId;
}
