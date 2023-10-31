package homework.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class memberDTO {
	private String id;
	private String passwd;
	private String name;
	private Date registerDate;
	private String email;

}
