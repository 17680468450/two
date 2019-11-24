package pojo;

import java.util.List;

public class CategoryThreeInfo {
	private STopThree sThree;
	private List<Commodity> commodities;
	
	

	public CategoryThreeInfo(STopThree sThree, List<Commodity> commodities) {
		super();
		this.sThree = sThree;
		this.commodities = commodities;
	}

	public CategoryThreeInfo() {
		super();
	}

	public STopThree getsThree() {
		return sThree;
	}

	public void setsThree(STopThree sThree) {
		this.sThree = sThree;
	}

	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

}
