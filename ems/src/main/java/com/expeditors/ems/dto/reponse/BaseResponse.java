package com.expeditors.ems.dto.reponse;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class BaseResponse extends BaseResponseWithoutData{

    private Object Data;

    public BaseResponse(String Status, String Message, Object data) {
        super(Status, Message);
        Data = data;
    }
}
