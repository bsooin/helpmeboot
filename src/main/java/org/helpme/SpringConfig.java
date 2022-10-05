package org.helpme;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {

    @Bean
    public String uploadPath(){
        return "C:\\team2";
    }

}
