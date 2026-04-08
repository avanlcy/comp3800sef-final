package comp3800sef.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                .requestMatchers(
                    new AntPathRequestMatcher("/"),
                    new AntPathRequestMatcher("/login"),
                    new AntPathRequestMatcher("/register"),
                    new AntPathRequestMatcher("/css/**"),
                    new AntPathRequestMatcher("/js/**"),
                    new AntPathRequestMatcher("/h2-console/**"),
                    new AntPathRequestMatcher("/error")
                ).permitAll()
                .requestMatchers(new AntPathRequestMatcher("/admin/**")).hasRole("TEACHER")
                .requestMatchers(
                    new AntPathRequestMatcher("/lectures/add"),
                    new AntPathRequestMatcher("/lectures/*/delete"),
                    new AntPathRequestMatcher("/lectures/*/materials/upload"),
                    new AntPathRequestMatcher("/lectures/*/materials/*/delete"),
                    new AntPathRequestMatcher("/lectures/*/comments/*/delete"),
                    new AntPathRequestMatcher("/polls/add"),
                    new AntPathRequestMatcher("/polls/*/delete"),
                    new AntPathRequestMatcher("/polls/*/comments/*/delete")
                ).hasRole("TEACHER")
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .defaultSuccessUrl("/", true)
                .permitAll()
            )
            .logout(logout -> logout
                .logoutSuccessUrl("/")
                .permitAll()
            )
            .headers(headers -> headers
                .frameOptions(frame -> frame.sameOrigin())
            )
            .csrf(csrf -> csrf
                .ignoringRequestMatchers(new AntPathRequestMatcher("/h2-console/**"))
            );
        return http.build();
    }
}
