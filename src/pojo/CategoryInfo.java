package pojo;

import java.util.List;

public class CategoryInfo {
    private STopOne sTopOne;
    private List<CategoryTwoInfo> sTopTwos;
    
    public CategoryInfo(STopOne sTopOne,List<CategoryTwoInfo> sTopTwos){
    	this.sTopOne = sTopOne;
    	this.sTopTwos = sTopTwos;
    }
    
	public CategoryInfo() {
		super();
	}
	public STopOne getsTopOne() {
		return sTopOne;
	}
	public void setsTopOne(STopOne sTopOne) {
		this.sTopOne = sTopOne;
	}

	public List<CategoryTwoInfo> getsTopTwos() {
		return sTopTwos;
	}

	public void setsTopTwos(List<CategoryTwoInfo> sTopTwos) {
		this.sTopTwos = sTopTwos;
	}
    
}
