package pe.edu.vallegrande.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class Customer {
    private int id;
    private String first_name;
    private String last_name;
    private String document_type;
    private String document_number;
    private String mobile;
    private String email;
    private Date state; // Asegúrate de que este sea de tipo java.sql.Date

    public Customer(int id, String first_name, String last_name, String document_type, String document_number, String mobile, String email, Date state) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.document_type = document_type;
        this.document_number = document_number;
        this.mobile = mobile;
        this.email = email;
        this.state = state;
    }

    // Getters y setters (no olvides incluir los getters y setters para 'state')
}