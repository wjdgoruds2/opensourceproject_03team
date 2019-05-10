package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BoardCommand {   
   //business logic을 구현하기 위한 execute 메서드를 정의한다.
   public void execute(HttpServletRequest request, HttpServletResponse response);   
}
