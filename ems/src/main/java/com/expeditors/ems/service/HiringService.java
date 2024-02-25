package com.expeditors.ems.service;

import com.expeditors.ems.dto.request.CreateCandidateRequest;
import com.expeditors.ems.entity.Candidate;
import com.expeditors.ems.entity.HiringStatus;
import com.expeditors.ems.entity.User;
import com.expeditors.ems.repository.CandidateRepository;
import com.expeditors.ems.repository.HiringStatusRepository;
import com.expeditors.ems.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

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

        User manager = new User();
        manager.setId(createCandidateRequest.getInterviewerId());
        candidate.setManager(manager);

        HiringStatus status = new HiringStatus();
        status.setId(1L);
        candidate.setStatus(status);
        candidate.setScheduledTime(LocalDateTime.now());
        candidateRepository.save(candidate);
    }
}
