package com.nbclass.service;

import com.nbclass.model.User;
import com.nbclass.vo.ResponseVo;

public interface UserService {

    ResponseVo add(User user);

    ResponseVo login(User user);
}
