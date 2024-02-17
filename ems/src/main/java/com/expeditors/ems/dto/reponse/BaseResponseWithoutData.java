package com.expeditors.ems.dto.reponse;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class BaseResponseWithoutData {
    private String Status;
    private String Message;
}
