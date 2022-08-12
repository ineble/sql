package com.spring.ex01;


import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class LoggingAdvice implements MethodInterceptor{

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		System.out.println("[메서드 호출 전 : LoggingAdvice]");
		System.out.println(invocation.getMethod() + " 메소드 호출 전");
		// 객체 안에 담긴 메소드를 호출하여 보여줌
		Object object = invocation.proceed();
		// 메소드를 호출하여 실행시킴
		
		System.out.println("[메서드 호출 후 : LoggingAdvice]");
		System.out.println(invocation.getMethod() + " 메소드 호출 후");
		// 객체 안의 담긴 메소드를 호출하여 보여줌
		return object;
	}
	
}
