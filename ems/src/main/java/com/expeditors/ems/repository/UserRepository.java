package com.expeditors.ems.repository;

import com.expeditors.ems.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {

    List<User> findByRoleNameNot(String name);

    List<User> findAllById(Long id);

    User findByName(String userName);

}
