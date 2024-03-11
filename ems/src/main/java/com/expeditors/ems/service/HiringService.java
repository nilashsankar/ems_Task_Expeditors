package com.expeditors.ems.service;

import com.expeditors.ems.dto.request.CandidateUpdateStatusRequest;
import com.expeditors.ems.dto.request.CreateCandidateRequest;
import com.expeditors.ems.dto.request.UserCreateRequest;
import com.expeditors.ems.entity.Candidate;
import com.expeditors.ems.entity.HiringStatus;
import com.expeditors.ems.entity.Role;
import com.expeditors.ems.entity.User;
import com.expeditors.ems.repository.CandidateRepository;
import com.expeditors.ems.repository.HiringStatusRepository;
import com.expeditors.ems.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;

@Service
public class HiringService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    HiringStatusRepository hiringStatusRepository;
    @Autowired
    CandidateRepository candidateRepository;
    @Autowired
    private RestTemplate restTemplate;

    public void createCandidate(CreateCandidateRequest createCandidateRequest) {
        Candidate candidate = new Candidate();
        candidate.setId(createCandidateRequest.getCanId());
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


    public String updateCandidateStatus(CandidateUpdateStatusRequest candidateUpdateStatusRequest) {
        //fetching data from db against the candidate id
        Candidate updateCandidate = candidateRepository.findById(candidateUpdateStatusRequest.getCanId()).orElseThrow(null);
        HiringStatus statusUpdate = new HiringStatus();
        statusUpdate.setId(candidateUpdateStatusRequest.getStatusUpdate());
        updateCandidate.setStatus(statusUpdate); //updating the status id
        candidateRepository.save(updateCandidate); //updating the status of candidate
        if(candidateUpdateStatusRequest.getStatusUpdate()==5) {
            //creating a new user for statusId = 5
            UserCreateRequest userCreateRequest = new UserCreateRequest();
            userCreateRequest.setName(updateCandidate.getName());
            userCreateRequest.setEmail(updateCandidate.getEmail());
            userCreateRequest.setRoleId(2);
            userCreateRequest.setPassword("admin2");
            Object response = this.restTemplate.postForObject("http://localhost:8080/user", userCreateRequest, Object.class);
            System.out.println(response);
            return "user processing--->"+response;
        }
        return "status updated";
    }
}
