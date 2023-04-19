package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.DeptVO;

public class DeptDAO {
//	쿼리문을 작성하고 데이터를 가져오는 역할을 하는 클래스
//	DAO(Data Access Object)
//	DTO(Data Transfer Object)
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	//모든 부서 조회
	public List<DeptVO> selectList() {
		
		//바깥에서 null값을 주는 이유는 나중에 닫아야하니까 
		List<DeptVO> list = new ArrayList<DeptVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from dept"; 
		
		try {
			//1.Connection정보를 얻어온다.
			conn = DBService.getInstance().getConnection();
			
			//2. 명령처리객체정보 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			//3. 결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DeptVO vo = new DeptVO();
				
				vo.setDeptno(rs.getInt("deptno"));
				vo.setDname(rs.getString("dname"));
				vo.setLoc(rs.getString("loc"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally { //예외가 발생하든 하지 않든 무조건 실행되는 구간
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;		
	}
	
//	public List<argType> selectList() {
//
//		List<argType> list = new ArrayList<argType>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "";
//
//		try {
//			//1.Connection얻어온다
//			conn = DBService.getInstance().getConnection();
//			//2.명령처리객체정보를 얻어오기
//			pstmt = conn.prepareStatement(sql);
//
//			//3.결과행 처리객체 얻어오기
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				argType vo = new argType();
//				//현재레코드값=>Vo저장
//
//				//ArrayList추가
//				list.add(vo);
//			}
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		} finally {
//
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//		return list;
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
