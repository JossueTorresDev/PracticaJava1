package pe.edu.vallegrande.app.model;

public class Customers {
	
	private Integer id;
	private String names;
	private String lastName;
	private String docType;
	private String docNum;
	private String email;
	private String cell;
	private String status;

	public Customers() {
		// TODO Auto-generated constructor stub
	}

	public Customers(Integer id, String names, String lastName, String docType, String docNum, String email,
			String cell, String status) {
		super();
		this.id = id;
		this.names = names;
		this.lastName = lastName;
		this.docType = docType;
		this.docNum = docNum;
		this.email = email;
		this.cell = cell;
		this.status = status;
	}

	public Customers(Integer id, String names, String lastName, String docType, String docNum, String email,
			String cell) {
		super();
		this.id = id;
		this.names = names;
		this.lastName = lastName;
		this.docType = docType;
		this.docNum = docNum;
		this.email = email;
		this.cell = cell;
	}

	public Customers(String names, String lastName, String docType, String docNum, String email, String cell) {
		super();
		this.names = names;
		this.lastName = lastName;
		this.docType = docType;
		this.docNum = docNum;
		this.email = email;
		this.cell = cell;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Customers [id=" + id + ", names=" + names + ", lastName=" + lastName + ", docType=" + docType
				+ ", docNum=" + docNum + ", email=" + email + ", cell=" + cell + ", status=" + status + "]";
	}
	
	
}
