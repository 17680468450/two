package pojo;

import java.util.List;

public class OrderAll {
	private OrderTotal oTotal;
	private List<OrderAbout> oAbouts;

	public OrderAll(OrderTotal oTotal, List<OrderAbout> oAbouts) {
		super();
		this.oTotal = oTotal;
		this.oAbouts = oAbouts;
	}

	public OrderAll() {
		super();
	}

	public OrderTotal getoTotal() {
		return oTotal;
	}

	public void setoTotal(OrderTotal oTotal) {
		this.oTotal = oTotal;
	}

	public List<OrderAbout> getoAbouts() {
		return oAbouts;
	}

	public void setoAbouts(List<OrderAbout> oAbouts) {
		this.oAbouts = oAbouts;
	}
  
}
