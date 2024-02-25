package com.expeditors.ems.endpoint;

import com.expeditors.ems.dto.request.CreateCandidateRequest;
import com.expeditors.ems.dto.response.BaseResponseWithoutData;
import com.expeditors.ems.service.HiringService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HiringEndpoint {
    @Autowired
    HiringService hiringService;
    @PostMapping("candidate")
    public BaseResponseWithoutData postCandidate(@RequestBody CreateCandidateRequest createCandidateRequest){
        hiringService.createCandidate(createCandidateRequest);
        return new BaseResponseWithoutData("success","inserted candidate");
    }
}
