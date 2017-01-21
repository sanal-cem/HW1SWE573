package com.bmi.service;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bmi.model.User;
/**
 * Created by Cem �anal.
 */

public class AccountService {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
    public static User user = new User();

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public String login(User userL) {
	    try
	    {
        if(user.getIsValid())
        {
        	try {
    			String query = "SELECT UNAME, PASS, "
    					+ "NAME, SURNAME , AGE, GENDER, "
    					+ "COMMENT, HEIGHT, WEIGHT, "
    					+ "BMI, WEIGHTTYPE FROM USERS "
    					+ "WHERE UNAME LIKE '"
    					+ userL.getuName() + "'"
    					+ " AND PASS LIKE '"
    					+ userL.getPass() + "'";
    		    for(Map<String, Object> row : jdbcTemplate.queryForList(query)){
    		    	user.setuName(row.get("UNAME").toString());
    		    	userL.setuName(row.get("UNAME").toString());
    		    	user.setPass(row.get("PASS").toString());
    		    	userL.setPass(row.get("PASS").toString());
    		    	user.setName(row.get("NAME").toString());
    		    	userL.setName(row.get("NAME").toString());
    		    	user.setSurName(row.get("SURNAME").toString());
    		    	userL.setSurName(row.get("SURNAME").toString());
    		    	user.setAge(row.get("AGE").toString());
    		    	userL.setAge(row.get("AGE").toString());
    		    	user.setGender(row.get("GENDER").toString());
    		    	userL.setGender(row.get("GENDER").toString());
    		    	user.setComment(row.get("COMMENT").toString());
    		    	userL.setComment(row.get("COMMENT").toString());
    		    	user.setHeight(Float.parseFloat(row.get("HEIGHT").toString()));
    		    	userL.setHeight(Float.parseFloat(row.get("HEIGHT").toString()));
    		    	user.setWeight(Float.parseFloat(row.get("WEIGHT").toString()));
    		    	userL.setWeight(Float.parseFloat(row.get("WEIGHT").toString()));
    		    	user.setBmi(Float.parseFloat(row.get("BMI").toString()));
    		    	userL.setBmi(Float.parseFloat(row.get("BMI").toString()));
    		    	user.setWeightType(row.get("WEIGHTTYPE").toString());
    		    	userL.setWeightType(row.get("WEIGHTTYPE").toString());
    		     }
    		} catch (Exception e) {
    			System.out.println(e.getMessage());
    			e.printStackTrace();
    			return "loginFailed";
    		}
	    	if(user.getPass().equals(userL.getPass()) == false)
	    		return "loginFailed";
	    	
	    	if(user.getuName().equals(userL.getuName()) == false)
	    		return "loginFailed";

        	return "loginSuccess";
        }else
        	//user name or password are not Valid
            return "logreg";
	    } catch (Throwable exc)
	    {
	        System.out.println(exc);
	    }
	    return "logreg";
	}
	
	public String reg(User userR) {
		float uBMI = calcUsersBMI(userR);
		userR.setBmi(uBMI);
		findUWeightType(userR);
		try {
			String sql = "INSERT INTO USERS("
					+ "UNAME, PASS, SURNAME, "
					+ "NAME, AGE, GENDER, COMMENT, "
					+ "HEIGHT, WEIGHT, BMI, WEIGHTTYPE "
					+ ") values(?,?,?,?,?,?,?,?,?,?)";
			jdbcTemplate.update(sql, new Object[] {
					userR.getuName(), userR.getPass(),
					userR.getSurName(), userR.getName(),
					userR.getAge(), userR.getGender(),
					userR.getComment(), userR.getHeight(),
					userR.getWeight(), uBMI, userR.getWeightType()
					});
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "regFailed";
		}
		return "regSuccess";
	}
	
	protected float calcUsersBMI(User u) {

		float weight = u.getWeight();
		float height = u.getHeight();
		String gender = u.getGender();
		float bmi = 0;

        if(height == 0) {
        	bmi = 0;
        }
        else {
        	//metric calculation.
        	bmi = ((weight)/(height * height));
        }
        return bmi;
	}
	//calculates weight situation considering gender.
	protected void findUWeightType(User u) {
		if(u.getGender() == "M"){
			if (u.getBmi() > 27.2 ) {
				u.setWeightType("O");
			}
			else if (u.getBmi() <= 27.2 ) {
				u.setWeightType("N");
			}
			else if (u.getBmi() <= 18.5 ) {
				u.setWeightType("U");
			}
		}
		else {
			if (u.getBmi() > 25 ) {
				u.setWeightType("O");
			}
			else if (u.getBmi() <= 18.5 ) {
				u.setWeightType("U");
			}
			else if (u.getBmi() <= 25 ) {
				u.setWeightType("N");
			}
		}
	}
	
	public String update(User userU) {
		float uBMI = calcUsersBMI(userU);
		userU.setBmi(uBMI);
		findUWeightType(userU);
		try {
			String sql = "UPDATE USERS "
					+ "SET UNAME = ?, PASS = ?, SURNAME = ?, "
					+ "NAME = ?, AGE = ?, GENDER = ?, COMMENT = ?, "
					+ "HEIGHT = ?, WEIGHT = ?, BMI = ?, WEIGHTTYPE = ? "
					+ "WHERE UNAME = '" + user.getuName() + "'";
			jdbcTemplate.update(sql, new Object[] {
					userU.getuName(), userU.getPass(),
					userU.getSurName(), userU.getName(),
					userU.getAge(), userU.getGender(),
					userU.getComment(), userU.getHeight(),
					userU.getWeight(), uBMI, userU.getWeightType()
					});
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "updFailed";
		}
    	user.setuName(userU.getuName());
    	user.setPass(userU.getPass());
    	user.setName(userU.getName());
    	user.setSurName(userU.getSurName());
    	user.setAge(userU.getAge());
    	user.setGender(userU.getGender());
    	user.setComment(userU.getComment());
    	user.setBmi(uBMI);
    	user.setWeightType(userU.getWeightType());
		return "updSuccess";
	}
}