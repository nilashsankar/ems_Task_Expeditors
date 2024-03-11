package com.expeditors.ems.endpoint;

import com.expeditors.ems.dto.request.CandidateUpdateStatusRequest;
import com.expeditors.ems.dto.request.CreateCandidateRequest;
import com.expeditors.ems.dto.response.BaseResponse;
import com.expeditors.ems.dto.response.BaseResponseWithoutData;
import com.expeditors.ems.service.HiringService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("candidate")
public class HiringEndpoint {
    @Autowired
    HiringService hiringService;

    @PostMapping
    public BaseResponseWithoutData postCandidate(@RequestBody CreateCandidateRequest createCandidateRequest){
        hiringService.createCandidate(createCandidateRequest);
        return new BaseResponseWithoutData("success","inserted candidate");
    }
    @PutMapping
    public BaseResponseWithoutData putStatus(@RequestBody CandidateUpdateStatusRequest candidateUpdateStatusRequest){

        return new BaseResponseWithoutData(" ",hiringService.updateCandidateStatus(candidateUpdateStatusRequest));
    }

}
