package com.cnjava.SpringBootProject.Config;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;

import com.cnjava.SpringBootProject.Config.AppConfig;
import com.cnjava.SpringBootProject.Service.UserDetailsServiceImpl;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

	
	@Autowired
    private UserDetailsServiceImpl userDetailsService;


    AppConfig appConfig = new AppConfig();
    
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

        // Sét đặt dịch vụ để tìm kiếm User trong Database.
        // Và sét đặt PasswordEncoder.
        auth.userDetailsService(userDetailsService).passwordEncoder(appConfig.passwordEncoder());

    }
    
    @Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http.csrf((csrf) -> csrf.disable());       
        // Các trang không yêu cầu login
        http.authorizeHttpRequests(authz -> authz.requestMatchers("/","/login","/loginfail","/logoutSuccessful","/product/*","/uploads/*","/category/*","/img/*").permitAll());
         http.authorizeHttpRequests(authz -> authz.requestMatchers("","/thucudoimoi","/cuahang","/lienhe","/savemes","/tintuc","/tintuc/*","/register","/addUser","/forgetPassword","/newPassword","/sendOTP","/updatePassword","/message","/home","/products","/brand/*","/searching","/error","/warranty","/security","/delivery","/pay","/tragop").permitAll());
         
        // Trang chỉ dành cho ADMIN

         http.authorizeHttpRequests(authz -> authz.requestMatchers("/admin/listaccount","/filteraccount","/admin","/admin/register","/admin/register/save","/admin/products","/admin/brands","/admin/categories","/addProduct","/deleteProduct","/addBrand","/renameBrand","/deleteBrand","/addCategory","/renameCategory","/deleteCategory").hasRole("ADMIN"));
         // Trang cho bat ky role
         http.authorizeHttpRequests(authz -> authz.requestMatchers("/payment/saveorder","/cart","/userinfo","/updateUser","/payment","/order","/addcart/*","/buynow/*","/submit-comment","/deletecomment","/cart/*","/updatequantity","/getCode","/deletecart/*","/checkout","/orderdetail","/searchorder","/editorder").hasAnyRole("ADMIN","USER"));

        
        http.exceptionHandling((exceptionHandling)  ->  exceptionHandling.accessDeniedHandler(new CustomAccessDeniedHandler()));
        http.exceptionHandling((exceptionHandling)  ->  exceptionHandling.authenticationEntryPoint(new CustomHttp403ForbiddenEntryPoint()));
        
        

        
        http.formLogin((formLogin) ->
        formLogin
        		 .usernameParameter("email")
        		 .passwordParameter("password")
        		 .loginPage("/login")
        		 .failureUrl("/loginfail")
                 .defaultSuccessUrl("/")
                 
        		);
        
        http
        .logout((logout) -> logout.logoutUrl("/logout"));
        
        http.logout((logout) -> logout
                .logoutSuccessUrl("/logoutSuccessful")
            );
        
        HttpSessionRequestCache requestCache = new HttpSessionRequestCache();
        requestCache.setMatchingRequestParameterName(null);
        http
            // ...
            .requestCache((cache) -> cache
                .requestCache(requestCache)
            );
        
        return http.build();
    }
    
    
    
    
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().requestMatchers("/css/**", "/js/**", "/img/**", "/lib/**", "/favicon.ico");
    }
    
    public class CustomHttp403ForbiddenEntryPoint implements AuthenticationEntryPoint {

        @Override
        public void commence(HttpServletRequest request, HttpServletResponse response,
                AuthenticationException authException) throws IOException, ServletException {
            response.getWriter().print("You need to login");
        }

    }
    
    public class CustomAccessDeniedHandler implements AccessDeniedHandler {

        @Override
        public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException arg2)
                throws IOException, ServletException {
            response.getWriter().print("You don't have role to access this page");
        }

    }
    
    
}
