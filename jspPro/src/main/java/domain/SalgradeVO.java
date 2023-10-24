package domain;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class SalgradeVO {
	private int grade;
	private int losal;
	private int hisal;
	
	@Override
	public String toString() {
		return "SalgradeVO [grade=" + grade + ", losal=" + losal + ", hisal=" + hisal + "]";
	}
	
}
