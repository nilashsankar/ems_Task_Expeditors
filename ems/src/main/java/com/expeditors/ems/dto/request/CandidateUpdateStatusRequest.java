package com.expeditors.ems.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CandidateUpdateStatusRequest {
    private Long canId;
    private Long statusUpdate;
}
