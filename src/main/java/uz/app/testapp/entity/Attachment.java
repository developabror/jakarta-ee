package uz.app.testapp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attachment {
    private final String id = UUID.randomUUID().toString();
    private String attachmentName;
    private String prefix;
    private String attachmentSize;
}
