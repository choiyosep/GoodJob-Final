package join.us.GoodJob.model.vo;

import java.util.List;

public class CompanySearchParamVO {
	private List<String> companyTypeList;
	private String address;
	private String companyName;
	public CompanySearchParamVO() {
		super();
	}
	public CompanySearchParamVO(List<String> companyTypeList, String address, String companyName) {
		super();
		this.companyTypeList = companyTypeList;
		this.address = address;
		this.companyName = companyName;
	}
	public List<String> getCompanyTypeList() {
		return companyTypeList;
	}
	public void setCompanyTypeList(List<String> companyTypeList) {
		this.companyTypeList = companyTypeList;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Override
	public String toString() {
		return "CompanySearchParamVO [companyTypeList=" + companyTypeList + ", address=" + address + ", companyName="
				+ companyName + "]";
	}
	
	
	
	
	
}
