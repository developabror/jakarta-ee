package uz.app.testapp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private final String id = UUID.randomUUID().toString();
    private String name;
    private String email;
    private String password;
}
