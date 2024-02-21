package com.expeditors.ems.handlers;

import com.expeditors.ems.dto.response.BaseResponseWithoutData;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionhandler {
    @ExceptionHandler({Exception.class})
    public ResponseEntity<?> handleException(Exception e) {
        final BaseResponseWithoutData baseResponse = new BaseResponseWithoutData("Failed", e.getMessage());
        return ResponseEntity.status(500).body(baseResponse);
    }
}
