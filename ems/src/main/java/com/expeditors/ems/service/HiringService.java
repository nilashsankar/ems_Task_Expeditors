package com.expeditors.ems.service;

import com.expeditors.ems.dto.request.CreateCandidateRequest;
import com.expeditors.ems.entity.Candidate;
import com.expeditors.ems.repository.CandidateRepository;
import com.expeditors.ems.repository.HiringStatusRepository;
import com.expeditors.ems.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HiringService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    HiringStatusRepository hiringStatusRepository;
    @Autowired
    CandidateRepository candidateRepository;

    public void createCandidate(CreateCandidateRequest createCandidateRequest) {
        Candidate candidate = new Candidate();
        candidate.setId(createCandidateRequest.getId());
        candidate.setName(createCandidateRequest.getName());
        candidate.setEmail(createCandidateRequest.getEmail());
        candidate.;
    }
}
