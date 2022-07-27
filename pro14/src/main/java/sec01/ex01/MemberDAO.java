package sec01.ex01;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import javax.sql.DataSource;




public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	MemberBean memberBean = new MemberBean();
	
	
	public MemberDAO() {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void addMember(MemberBean m) {
		try {
			Connection con = dataFactory.getConnection();
			String id = memberBean.getId();
			String pwd = memberBean.getPwd();
			String name = memberBean.getName();
			String email = memberBean.getEmail();
			String query = "insert into t_member";
			query += " (id,pwd,name,email) ";
			query += " values(?,?,?,?)";
			System.out.println("preparedStatement: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public List  listMembers() {
		List list = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = "select * from t_member order by joinDate desc";
			System.out.println("prepareStatement: " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				MemberBean vo = new MemberBean();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
