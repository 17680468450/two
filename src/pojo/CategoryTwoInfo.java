package pojo;

import java.util.List;

public class CategoryTwoInfo {
    private STopTwo sTopTwo;
    private List<STopThree> sTopThrees;
    
	public CategoryTwoInfo(STopTwo sTopTwo, List<STopThree> sTopThrees) {
		super();
		this.sTopTwo = sTopTwo;
		this.sTopThrees = sTopThrees;
	}
	public CategoryTwoInfo() {
		super();
	}
	public STopTwo getsTopTwo() {
		return sTopTwo;
	}
	public void setsTopTwo(STopTwo sTopTwo) {
		this.sTopTwo = sTopTwo;
	}
	public List<STopThree> getsTopThrees() {
		return sTopThrees;
	}
	public void setsTopThrees(List<STopThree> sTopThrees) {
		this.sTopThrees = sTopThrees;
	}
}
