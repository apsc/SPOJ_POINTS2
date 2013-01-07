package p1;
public class spojBean{
    private String code;

    public String getCode() {

        return code;
    }
    public void setCode(String code)
    {
       this.code=code.toUpperCase();

    }
    public String submit() {
		if(code==""||code==null)
		return "false";
		else
        return "true";
    }
}