package domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmpVO {

//	EMPNO    NOT NULL NUMBER(4)    
//	ENAME             VARCHAR2(10) 
//	JOB               VARCHAR2(9)  
//	MGR               NUMBER(4)    
//	HIREDATE          DATE         
//	SAL               NUMBER(7,2)  
//	COMM              NUMBER(7,2)  
//	DEPTNO
	
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private String hiredate;
	private double sal;
	private double comm;
	private int deptno;
	
	@Override
	public String toString() {
		return "EmpVO [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hiredate=" + hiredate
				+ ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + "]";
	}
	
	
}
